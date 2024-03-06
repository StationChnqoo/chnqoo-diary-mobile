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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: MyCard(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '日记',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              MyIconButton(
                height: 32.w,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.black54,
                ),
                onPress: () {
                  Get.toNamed(RoutesClass.LIST_NOTE);
                },
                reverse: true,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: NoteCount.loadNoteCounts()
                .map(
                  (e) => Container(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        e.icon,
                        size: 28.w,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text(
                        '${e.name}${e.value}',
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      )
                    ],
                  )),
                )
                .toList(),
          )
        ],
      )),
    );
  }
}
