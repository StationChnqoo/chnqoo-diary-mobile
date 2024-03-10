import 'dart:async';

import 'package:chnqoo_diary_mobile/constants/common_menu.dart';
import 'package:chnqoo_diary_mobile/constants/get_stores.dart';
import 'package:chnqoo_diary_mobile/constants/services.dart';
import 'package:chnqoo_diary_mobile/constants/user.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:chnqoo_diary_mobile/widgets/my_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Menu extends StatelessWidget {
  final onPress;
  final CommonMenu menu;
  final id;

  Menu({required this.onPress, required this.menu, required this.id});

  @override
  Widget build(BuildContext context) {
    bool isChecked = id == menu.name;
    final color = Theme.of(context).primaryColor;

    return Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: GestureDetector(
            onTap: () {
              onPress(menu.name);
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: isChecked ? color : Colors.black12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      menu.icon,
                      size: 28,
                      color: isChecked ? color : Colors.black54,
                    ),
                    SizedBox(height: 2),
                    Text(
                      menu.name,
                      style: TextStyle(
                          fontSize: 12,
                          color: isChecked ? color : Colors.black54),
                    )
                  ],
                )),
          ),
        ));
  }
}
