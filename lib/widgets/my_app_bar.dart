import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  MyAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      centerTitle: true,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(.58),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
