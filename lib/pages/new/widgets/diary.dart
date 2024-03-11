import 'package:cached_network_image/cached_network_image.dart';
import 'package:chnqoo_diary_mobile/constants/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DiaryItem extends StatelessWidget {
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
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '11/',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black87),
                              ),
                              Text(
                                '3',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                            ],
                          ),
                          Text(
                            '2024',
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                      ),
                      width: 4,
                      height: double.infinity,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '我真的是栓Q了家人们',
                                maxLines: 3,
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                ),
                              ),
                              CachedNetworkImage(
                                imageUrl: '${Config.CDN}/wechat/吃瓜.png',
                                height: 24,
                                width: 24,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '今诸生学于太学，县官日有廪稍之供，父母岁有裘葛之遗，无冻馁之患矣。坐大厦之下而诵诗书，无奔走之劳矣。',
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                overflow: TextOverflow.ellipsis),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              ...[1, 2, 3, 4]
                                  .map((e) => Container(
                                        margin: EdgeInsets.only(right: 4),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                '${Config.CDN}/mock/life${e}.jpg',
                                            height: 48,
                                            width: 48,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ))
                                  .toList()
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          )
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
