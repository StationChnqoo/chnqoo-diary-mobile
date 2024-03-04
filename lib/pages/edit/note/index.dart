import 'package:chnqoo_diary_mobile/constants/note_item.dart';
import 'package:chnqoo_diary_mobile/pages/edit/widgets/bottoms.dart';
import 'package:chnqoo_diary_mobile/pages/edit/widgets/images_selector.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:chnqoo_diary_mobile/widgets/my_filled_button.dart';
import 'package:chnqoo_diary_mobile/widgets/my_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:chnqoo_diary_mobile/constants/states_provider.dart';
import 'package:chnqoo_diary_mobile/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

class EditNotePage extends StatefulWidget {
  const EditNotePage({super.key});

  @override
  State<StatefulWidget> createState() => EditNotePageState();
}

class EditNotePageState extends State<EditNotePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  StatesProvider statesProvider = StatesProvider();
  NoteItem noteItem = NoteItem.buildDefaultNoteItem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppBar(title: '编辑笔记'),
      resizeToAvoidBottomInset: false,
      body: Consumer<StatesProvider>(
        builder: (context, value, child) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyCard(
                        child: Column(
                      children: [
                        TextField(
                          minLines: 1,
                          maxLines: 4,
                          textAlignVertical: TextAlignVertical.top,
                          decoration: InputDecoration(
                              // hintText: '简要备注 ...',
                              label: Text('请简单备注 ...'),
                              // contentPadding:
                              //     EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                      ],
                    )),
                    SizedBox(
                      height: 12,
                    ),
                    ImagesSelector(
                        images: noteItem.images,
                        onUpload: () {},
                        onDeleted: () {}),
                    SizedBox(
                      height: 12,
                    ),
                    EditBottons(onDeletePress: () {}, onSavePress: () {})
                  ]),
            ),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
