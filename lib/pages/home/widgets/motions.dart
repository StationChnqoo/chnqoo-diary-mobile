import 'package:cached_network_image/cached_network_image.dart';
import 'package:chnqoo_diary_mobile/constants/config.dart';
import 'package:chnqoo_diary_mobile/routes/routes.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:chnqoo_diary_mobile/widgets/my_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeMotions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding:
            EdgeInsets.symmetric(horizontal: Config.PAGE_PADDING, vertical: 5),
        child: MyCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '心情',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  MyIconButton(
                    height: 32.w,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.black54,
                    ),
                    onPress: () {
                      Get.toNamed(RoutesClass.LIST_NOTE);
                    },
                    reverse: true,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Column(
                children: [1, 2, 3]
                    .map(
                      (e) => Container(
                          // color: Colors.white,
                          margin: EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            children: [
                              Text(
                                '12:34',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 14),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                  child: Text(
                                '您今天还记录心情，啥也不是 ...',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black87),
                              )),
                              SizedBox(
                                width: 6,
                              ),
                              CachedNetworkImage(
                                imageUrl:
                                    '${dotenv.get('CDN')}/wechat/%E5%90%83%E7%93%9C.png',
                                height: 18,
                              ),
                            ],
                          )),
                    )
                    .toList(),
              )
            ],
          ),
        ));
  }
}
