import 'dart:math';

import 'package:chnqoo_diary_mobile/constants/config.dart';
import 'package:chnqoo_diary_mobile/routes/routes.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:chnqoo_diary_mobile/widgets/my_check_box.dart';
import 'package:chnqoo_diary_mobile/widgets/my_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeTodos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '待办事项',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        SizedBox(
          width: 12,
        ),
        Column(
          children: ['吃饭', '睡觉', '打豆豆'].map(
            (e) {
              bool checked = Random().nextBool();
              return GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      MyCheckBox(value: checked, onChanged: (value) {}),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: Text(
                        e,
                        style: TextStyle(
                            decoration: checked
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            fontSize: 14,
                            color: checked ? Colors.black54 : Colors.black87),
                      )),
                    ],
                  ));
            },
          ).toList(),
        )
      ],
    );
  }
}
