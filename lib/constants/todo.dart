import 'package:chnqoo_diary_mobile/constants/x.dart';

class Todo {
  String id;
  String content;
  bool isRepeat;
  bool isDone;
  String createTime;
  String updateTime;

  Todo(
      {required this.id,
      required this.content,
      required this.isRepeat,
      required this.isDone,
      required this.createTime,
      required this.updateTime});

  static buildDefaultTodoItem() => Todo(
      id: '',
      content: '',
      isRepeat: true,
      isDone: false,
      createTime: x.useCurrentTime(),
      updateTime: x.useCurrentTime());
}
