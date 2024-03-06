import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyAvatar extends StatelessWidget {
  final url;
  final double size;
  final onPress;

  const MyAvatar(
      {required this.url, required this.size, required this.onPress});

  @override
  Widget build(BuildContext context) {
    bool isUselessUrl = (url == Null || url == null || url == "");
    return GestureDetector(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(size / 2),
            child: isUselessUrl
                ? Image.asset('assets/common_avatar_unknown.png',
                    width: size, height: size, fit: BoxFit.fill)
                : CachedNetworkImage(
                    imageUrl: url,
                    width: size,
                    height: size,
                    fit: BoxFit.fill,
                  )),
        onTap: () => onPress());
  }
}
