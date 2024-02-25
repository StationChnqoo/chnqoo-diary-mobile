import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final double size;

  MyCheckBox({
    this.size = 24.0,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size,
        width: size,
        child: Checkbox(
          value: value,
          onChanged: onChanged,
          // checkColor: Colors.green,
          // activeColor: Colors.green,
        ));
  }
}
