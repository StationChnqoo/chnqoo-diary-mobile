import 'package:flutter/material.dart';
import 'package:chnqoo_diary_mobile/constants/states_provider.dart';
import 'package:chnqoo_diary_mobile/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

class EditDiaryPage extends StatefulWidget {
  const EditDiaryPage({super.key});

  @override
  State<StatefulWidget> createState() => EditDiaryPageState();
}

class EditDiaryPageState extends State<EditDiaryPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  StatesProvider statesProvider = StatesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppBar(title: '编辑日记'),
      resizeToAvoidBottomInset: false,
      body: Consumer<StatesProvider>(
        builder: (context, value, child) {
          return Container(
            padding: EdgeInsets.all(12),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 6,
              ),
            ]),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
