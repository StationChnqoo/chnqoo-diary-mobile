import 'dart:math';

import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:chnqoo_diary_mobile/widgets/my_check_box.dart';
import 'package:chnqoo_diary_mobile/widgets/my_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTodos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: MyCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '待办事项',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
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
                              MyCheckBox(
                                  value: Random().nextBool(),
                                  onChanged: (value) {}),
                              SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                  child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black87),
                              )),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                '12:34',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 14),
                              )
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
