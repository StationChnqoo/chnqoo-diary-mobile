import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final double size;

  MyCheckBox({
    this.size = 20.0,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(
          value
              ? 'assets/checkbox_status_1.png'
              : 'assets/checkbox_status_0.png',
          height: size,
          width: size,
          color: value ? Colors.black26 : Theme.of(context).primaryColor),
    );
    // return SizedBox(
    //     height: size,
    //     width: size,
    //     child: Checkbox(
    //       value: value,
    //       onChanged: onChanged,
    //       // checkColor: Colors.green,
    //       // activeColor: Colors.green,
    //     ));
  }
}
