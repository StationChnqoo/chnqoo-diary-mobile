import 'package:cached_network_image/cached_network_image.dart';
import 'package:chnqoo_diary_mobile/constants/config.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoteItem extends StatelessWidget {
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
                          ClipRRect(
                            child: CachedNetworkImage(
                              imageUrl: 'https://blog.cctv3.net/i.jpg',
                              height: 40,
                              width: 40,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        flex: 1,
                        child: MyCard(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '家人们我真的是栓Q了',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
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
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.favorite_border_outlined,
                                      size: 16,
                                      color: Colors.black54,
                                    ),
                                    Text(
                                      '12',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black54),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 24,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.messenger_outline,
                                      size: 16,
                                      color: Colors.black54,
                                    ),
                                    Text(
                                      '34',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black54),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        )))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
