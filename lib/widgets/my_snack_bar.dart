import 'dart:ui';

import 'package:flutter/material.dart';

class MySnackBar {
  final context;
  Color? color;
  MySnackBar({required this.context, this.color = Colors.black87});
  void success(String message) {
    color = Colors.green;
    _show(message);
  }

  void error(String message) {
    color = Colors.redAccent;
    _show(message);
  }

  void toast(String message) {
    color = Colors.black87;
    _show(message);
  }

  void _show(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      showCloseIcon: true,
      elevation: 1,
      margin: EdgeInsets.all(16),
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
    ));
  }
}
