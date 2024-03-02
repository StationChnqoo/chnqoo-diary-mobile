import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppBar(title: '编辑笔记'),
      resizeToAvoidBottomInset: false,
      body: Consumer<StatesProvider>(
        builder: (context, value, child) {
          return Container(
            padding: EdgeInsets.all(12),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              MyCard(
                  child: Column(
                children: [
                  TextField(
                    minLines: 1,
                    maxLines: 4,
                    maxLength: 32,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                        // hintText: '简要备注 ...',
                        label: Text('备注信息 ...'),
                        // contentPadding:
                        //     EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  )
                ],
              ))
            ]),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
