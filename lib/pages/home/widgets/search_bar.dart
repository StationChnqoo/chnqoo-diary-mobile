import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSeachBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Row(children: [
          Icon(
            Icons.search,
            color: Colors.white.withOpacity(0.38),
            size: 28.w,
          ),
        ]),
        width: double.infinity,
        height: 32.w,
        // margin: EdgeInsets.symmetric(horizontal: 12),
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.28),
            borderRadius: BorderRadius.circular(16.w)));
  }
}
