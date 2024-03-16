import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chnqoo_diary_mobile/constants/config.dart';
import 'package:chnqoo_diary_mobile/constants/note_count.dart';
import 'package:chnqoo_diary_mobile/routes/routes.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:chnqoo_diary_mobile/widgets/my_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '啥也不是你 ...',
          style: TextStyle(
              color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(
          '啥也不是你 ...',
          style: TextStyle(color: Colors.black54, fontSize: 12),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: CachedNetworkImage(
            imageUrl: '${Config.CDN}/mock/life${Random().nextInt(4) + 1}.jpg',
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        )
      ],
    );
  }
}
