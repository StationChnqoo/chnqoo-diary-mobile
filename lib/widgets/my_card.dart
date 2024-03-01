import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCard extends StatelessWidget {
  final Widget child;

  MyCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: child,
        ),
        elevation: 1);
  }
}
