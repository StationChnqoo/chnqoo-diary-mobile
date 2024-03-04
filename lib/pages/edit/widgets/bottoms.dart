import 'package:chnqoo_diary_mobile/widgets/my_filled_button.dart';
import 'package:chnqoo_diary_mobile/widgets/my_outline_button.dart';
import 'package:flutter/material.dart';

class EditBottons extends StatelessWidget {
  final onDeletePress;
  final onSavePress;

  const EditBottons({required this.onDeletePress, required this.onSavePress});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MyOutlineButton(
              text: '删除',
              icon: Icon(
                Icons.delete_outline_outlined,
                size: 20,
              ),
              onPress: onDeletePress),
          SizedBox(
            width: 10,
          ),
          MyFilledButton(
              text: '保存',
              icon: Icon(
                Icons.upload_file,
                size: 20,
              ),
              onPress: onSavePress),
        ],
      ),
    );
  }
}
