import 'package:cached_network_image/cached_network_image.dart';
import 'package:chnqoo_diary_mobile/constants/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MoodItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: double.infinity,
        child: Container(
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: '${Config.CDN}/wechat/666666.png',
                      height: 44,
                      width: 44,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2024-03-12 00:36',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '我真的是栓Q了家人们',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            '今诸生学于太学，县官日有廪稍之供，父母岁有裘葛之遗，无冻馁之患矣。坐大厦之下而诵诗书，无奔走之劳矣。',
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
