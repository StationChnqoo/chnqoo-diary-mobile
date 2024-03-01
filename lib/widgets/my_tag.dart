import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTag extends StatelessWidget {
  final String text;
  final onPress;
  final isActive;

  MyTag({this.text = '', required this.onPress, required this.isActive});

  @override
  Widget build(BuildContext context) {
    var color = isActive ? Theme.of(context).primaryColor : Colors.black45;

    return GestureDetector(
        onTap: () => onPress(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 1, horizontal: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: color)),
          child: Center(
            child: Text(text, style: TextStyle(color: color, fontSize: 12)),
          ),
        ));
  }
}
