import 'package:chnqoo_diary_mobile/constants/anniversary_item.dart';
import 'package:chnqoo_diary_mobile/constants/states_provider.dart';
import 'package:chnqoo_diary_mobile/pages/edit/widgets/date_selector.dart';
import 'package:chnqoo_diary_mobile/widgets/my_app_bar.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:chnqoo_diary_mobile/widgets/my_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditAnniversaryPage extends StatefulWidget {
  const EditAnniversaryPage({super.key});

  @override
  State<StatefulWidget> createState() => EditAnniversaryPageState();
}

class EditAnniversaryPageState extends State<EditAnniversaryPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  StatesProvider statesProvider = StatesProvider();
  AnniversaryItem anniversary = AnniversaryItem.buildDefaultAnniversaryItem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppBar(title: '编辑纪念日'),
      resizeToAvoidBottomInset: false,
      body: Consumer<StatesProvider>(
        builder: (context, value, child) {
          return Container(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  MyCard(
                      child: Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: '描述事件 ...',
                          ),
                          style: TextStyle(fontSize: 16),
                        ),
                        TextField(
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: '发表感想 ...',
                            border: InputBorder.none,
                          ),
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  DateSelector(
                    date: anniversary.happenedDate,
                    onDateChanged: (date) {
                      anniversary.happenedDate = date;
                      setState(() {});
                    },
                  )
                ],
              ));
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
