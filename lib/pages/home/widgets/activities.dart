import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:chnqoo_diary_mobile/widgets/my_icon_button.dart';
import 'package:chnqoo_diary_mobile/widgets/my_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;

class HomeActivities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              '您的近期使用体验如何呢\n快来告诉我们吧 ~',
              '平台近期违规用户处罚公示 ~',
            ]
                .map((e) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        // color: Colors.white
                      ),
                    child: MyCard(
                        child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          height: 72.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '记了吗 · 2月份用户满意度调查',
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 10),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Expanded(
                                  child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500),
                              ))
                            ],
                          ),
                        )),
                        SizedBox(
                          width: 6,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            '${dotenv.get("CDN")}/activity-1.jpg',
                            height: 72.w,
                            width: 72.w,
                          ),
                        )
                      ],
                    ))))
                .toList(),
          )
        ],
      ),
    );
  }
}
