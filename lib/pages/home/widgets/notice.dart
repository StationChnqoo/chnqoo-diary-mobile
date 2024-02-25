import 'package:flutter/material.dart';

class HomeNotice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), color: Colors.white),
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
        ));
  }
}
