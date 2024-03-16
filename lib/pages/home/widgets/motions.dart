import 'package:cached_network_image/cached_network_image.dart';
import 'package:chnqoo_diary_mobile/constants/config.dart';
import 'package:chnqoo_diary_mobile/routes/routes.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:chnqoo_diary_mobile/widgets/my_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeMotions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '我的心情',
              style: TextStyle(color: Colors.black54, fontSize: 12),
            ),
            CachedNetworkImage(
              imageUrl: '${dotenv.get('CDN')}/wechat/%E5%90%83%E7%93%9C.png',
              height: 18,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        SizedBox(
          height: 4,
        ),
        Container(
            // color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  '您今天还记录心情，啥也不是 ...',
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                )),
              ],
            ))
      ],
    );
  }
}
