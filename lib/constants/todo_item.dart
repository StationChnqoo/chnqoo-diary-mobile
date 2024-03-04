import 'package:chnqoo_diary_mobile/constants/x.dart';

class TodoItem {
  String id;
  String content;
  bool isRepeat;
  bool isDone;
  String createTime;
  String updateTime;

  TodoItem(
      {required this.id,
      required this.content,
      required this.isRepeat,
      required this.isDone,
      required this.createTime,
      required this.updateTime});

  static buildDefaultTodoItem() => TodoItem(
      id: '',
      content: '',
      isRepeat: true,
      isDone: false,
      createTime: x.useCurrentTime(),
      updateTime: x.useCurrentTime());
}
