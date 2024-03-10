import 'package:chnqoo_diary_mobile/constants/common_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyListTile extends StatelessWidget {
  final CommonMenu menu;
  final onPress;

  MyListTile({required this.menu, required this.onPress});

  @override
  Widget build(BuildContext context) {
    // return Card.filled(
    //     child: Container(
    //       padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
    //       child: child,
    //     ),
    //     elevation: 4);
    return GestureDetector(
      onTap: () {
        onPress(menu);
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    menu.icon,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    menu.name,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  )
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black54,
              )
            ],
          )),
    );
  }
}
