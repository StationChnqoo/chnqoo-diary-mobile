import 'package:flutter/material.dart';

class MyFilledButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final double? height;
  final onPress;

  MyFilledButton(
      {this.height = 32,
      required this.text,
      required this.icon,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: FilledButton.icon(
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
