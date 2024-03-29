import 'package:chnqoo_diary_mobile/constants/config.dart';
import 'package:chnqoo_diary_mobile/routes/routes.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:chnqoo_diary_mobile/widgets/my_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeDates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin:
            EdgeInsets.symmetric(horizontal: Config.PAGE_PADDING, vertical: 5),
        child: MyCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '纪念日',
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
                children: ['吃饭', '睡觉', '打豆豆']
                    .map(
                      (e) => GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black87),
                              )),
                              SizedBox(
                                width: 6,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '还有',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12),
                                    ),
                                    TextSpan(
                                      text: '123',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 16),
                                    ),
                                    TextSpan(
                                      text: ' 天',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12),
                                    ),
                                  ],
                                ),
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
