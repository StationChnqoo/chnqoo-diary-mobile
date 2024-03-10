import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:flutter/material.dart';

class HomeNotice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: MyCard(
          child: Row(
            children: [
              Icon(
                Icons.public,
                size: 20,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '关于进一步规范用户行为须知 ...',
                style: TextStyle(color: Colors.black54, fontSize: 14),
              )
            ],
          ),
        ));
  }
}
