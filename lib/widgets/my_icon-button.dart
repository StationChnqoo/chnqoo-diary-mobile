import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyIconButton extends StatelessWidget {
  final double height;
  final double iconSize;
  final VoidCallback onPress;
  final Icon icon;
  final Text? text;
  final bool? reverse;
  
  MyIconButton(
      {this.height = 32,
      this.iconSize = 16,
      this.reverse = false,
      required this.onPress,
      required this.icon,
      this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
        child: Container(
          height: height,
          // decoration: BoxDecoration(color: Colors.white),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: reverse!
                ? [if (text != null) text!, icon]
                : [icon, if (text != null) text!],
          ),
        ));
  }
}
