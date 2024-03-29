import 'package:flutter/material.dart';

class MyOutlineButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final double? height;
  final onPress;

  MyOutlineButton(
      {this.height = 32,
      required this.text,
      required this.icon,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: OutlinedButton.icon(
        onPressed: onPress,
        label: Text(text),
        icon: icon,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 12.0), // 设置水平内边距为20.0
          ),
        ),
      ),
    );
  }
}
