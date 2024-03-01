import 'package:chnqoo_diary_mobile/constants/x.dart';

class TodoItem {
  String id;
  String title;
  String message;
  bool isRepeat;
  bool isDone;
  String createTime;
  String updateTime;

  TodoItem(
      {required this.id,
      required this.title,
      required this.message,
      required this.isRepeat,
      required this.isDone,
      required this.createTime,
      required this.updateTime});

  static buildDefaultTodoItem() => TodoItem(
      id: '',
      title: '',
      message: '',
      isRepeat: true,
      isDone: false,
      createTime: x.useCurrentTime(),
      updateTime: x.useCurrentTime());
}
