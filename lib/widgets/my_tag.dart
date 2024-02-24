import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTag extends StatelessWidget {
  final String text;

  MyTag({
    this.text = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 16,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 0.5, color: Theme.of(context).primaryColor)),
      child: Center(
        child: Text(text,
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 10)),
      ),
    );
  }
}
