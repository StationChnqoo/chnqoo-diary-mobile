import 'dart:developer';

import 'package:chnqoo_diary_mobile/constants/services.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:chnqoo_diary_mobile/widgets/my_icon_button.dart';
import 'package:chnqoo_diary_mobile/widgets/my_outline_button.dart';
import 'package:chnqoo_diary_mobile/widgets/my_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ImagesSelector extends StatefulWidget {
  final List<String> images;
  final onDeleted;
  final onUpload;

  const ImagesSelector(
      {super.key,
      required this.images,
      required this.onUpload,
      required this.onDeleted});

  @override
  State<StatefulWidget> createState() => ImagesSelectorState();
}

class ImagesSelectorState extends State<ImagesSelector> {
  onMorePhotoPress(context) async {
    var picker = ImagePicker();
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      print("Picked image: ${pickedImage.path} --> ${pickedImage.name}");
      widget.onUpload(pickedImage.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyCard(
        child: Container(
            child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.photo_size_select_large_outlined,
                  color: Theme.of(context).primaryColor,
                  size: 18,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  '图片',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            MyIconButton(
              onPress: () => onMorePhotoPress(context),
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black54,
                size: 16,
              ),
              reverse: true,
              text: Text(
                '上传图片',
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            )
          ],
        ),
        ...widget.images.map((e) => Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  ClipRRect(
                    child: Image.network(
                      e,
                      height: 36.w,
                      width: 36.w,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Text(
                          e.split('/').last,
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                  IconButton(
                    onPressed: () {
                      widget.onDeleted(e);
                    },
                    icon: Icon(
                      Icons.delete_outline_outlined,
                      color: Colors.redAccent,
                    ),
                    hoverColor: Colors.redAccent.withOpacity(0.8),
                  )
                ],
              ),
            ))
      ],
    )));
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ImagesSelector oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }
}
