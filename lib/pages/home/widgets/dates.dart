import 'package:chnqoo_diary_mobile/widgets/my_icon-button.dart';
import 'package:chnqoo_diary_mobile/widgets/my_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;

class HomeDates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                onPress: () {},
                reverse: true,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          Column(
            children: ['吃饭', '睡觉', '打豆豆']
                .map(
                  (e) => Material(
                      color: Colors.white,
                      child: InkWell(
                          onTap: () {},
                          splashColor: Colors.black87.withOpacity(0.08),
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
                          ))),
                )
                .toList(),
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
    );
  }
}
