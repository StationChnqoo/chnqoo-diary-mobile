import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:chnqoo_diary_mobile/widgets/my_icon_button.dart';
import 'package:chnqoo_diary_mobile/widgets/my_snack_bar.dart';
import 'package:flutter/material.dart';

class ImagesSelector extends StatefulWidget {
  final List<String> images;
  final onDeleted;
  final onUploaded;

  const ImagesSelector(
      {super.key,
      required this.images,
      required this.onUploaded,
      required this.onDeleted});

  @override
  State<StatefulWidget> createState() => ImagesSelectorState();
}

class ImagesSelectorState extends State<ImagesSelector> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyCard(
        child: Container(
      child: Row(
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
            onPress: () async {
              MySnackBar(context: context).success(
                  'A lightweight message with an optional action which briefly displays at the bottom of the screen.');
              // var picker = ImagePicker();
              // var pickedImage =
              //     await picker.pickImage(source: ImageSource.gallery);
              // if (pickedImage != null) {
              //   print(
              //       "Picked image: ${pickedImage.path} --> ${pickedImage.name}");
              //   ScaffoldMessenger.of(context)
              //       .showSnackBar(SnackBar(content: Text('HelloWorld.')));
              // }
            },
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
    ));
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
