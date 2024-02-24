import 'package:chnqoo_diary_mobile/constants/states_provider.dart';
import 'package:chnqoo_diary_mobile/constants/x.dart';
import 'package:chnqoo_diary_mobile/widgets/slide_menu.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

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
