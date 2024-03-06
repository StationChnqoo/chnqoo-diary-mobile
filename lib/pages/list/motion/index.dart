import 'package:chnqoo_diary_mobile/constants/motion.dart';
import 'package:chnqoo_diary_mobile/pages/edit/widgets/bottoms.dart';
import 'package:chnqoo_diary_mobile/pages/edit/widgets/emoji_selector.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:chnqoo_diary_mobile/widgets/my_app_bar.dart';

class ListMotionPage extends StatefulWidget {
  const ListMotionPage({super.key});

  @override
  State<StatefulWidget> createState() => ListMotionPageState();
}

class ListMotionPageState extends State<ListMotionPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Motion motionItem = Motion.buildDefaultMotionItem();

  void onEmojiPress(String s) {
    motionItem.emoji = s;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: MyAppBar(title: '编辑心情'),
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 12,
              ),
              MyCard(
                child: TextField(
                  minLines: 1,
                  maxLines: 4,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                      // hintText: '简要备注 ...',
                      label: Text('请展开详细说说 ...'),
                      // contentPadding:
                      //     EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              EmojiSelector(emoji: motionItem.emoji, onPress: onEmojiPress),
              SizedBox(
                height: 12,
              ),
              EditBottons(onDeletePress: () {}, onSavePress: () {}),
              SizedBox(
                height: 12,
              ),
            ]),
          ),
        ));
  }
}
