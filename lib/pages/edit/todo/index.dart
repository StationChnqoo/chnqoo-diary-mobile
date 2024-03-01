import 'package:chnqoo_diary_mobile/constants/todo_item.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:chnqoo_diary_mobile/widgets/my_switcher.dart';
import 'package:flutter/material.dart';
import 'package:chnqoo_diary_mobile/constants/states_provider.dart';
import 'package:chnqoo_diary_mobile/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

class EditTodoPage extends StatefulWidget {
  const EditTodoPage({super.key});

  @override
  State<StatefulWidget> createState() => EditTodoPageState();
}

class EditTodoPageState extends State<EditTodoPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  StatesProvider statesProvider = StatesProvider();
  TodoItem todo = TodoItem.buildDefaultTodoItem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppBar(title: '编辑待办事项'),
      resizeToAvoidBottomInset: false,
      body: Consumer<StatesProvider>(
        builder: (context, value, child) {
          return Container(
            padding: EdgeInsets.all(12),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              MyCard(
                  child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: '请输入待办事项内容 ...',
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '每日提醒',
                          style: TextStyle(fontSize: 14),
                        ),
                        MySwitcher(
                            value: todo.isRepeat,
                            onChanged: (value) {
                              todo.isRepeat = !todo.isRepeat;
                              setState(() {});
                            })
                      ],
                    ),
                  ],
                ),
              )),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {},
                        label: Text('删除'),
                        icon: Icon(Icons.delete),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      OutlinedButton.icon(
                        onPressed: () {},
                        label: Text('保存'),
                        icon: Icon(Icons.send),
                      )
                    ],
                  )
                ],
              )
            ]),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
