import 'package:chnqoo_diary_mobile/constants/x.dart';

class NoteItem {
  String id;
  String userId;
  String content;
  List<String> images;
  bool isDeleted;
  bool isPublic;
  String createTime;
  String updateTime;

  NoteItem(
      {required this.id,
      required this.userId,
      required this.content,
      required this.images,
      required this.isDeleted,
      required this.isPublic,
      required this.createTime,
      required this.updateTime});

  static buildDefaultNoteItem() => NoteItem(
      id: '',
      userId: '',
      content: '',
      images: [],
      isDeleted: false,
      isPublic: false,
      createTime: x.useCurrentTime(),
      updateTime: x.useCurrentTime());

  NoteItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        content = json['content'],
        isDeleted = json['isDeleted'],
        isPublic = json['isPublic'],
        createTime = json['createTime'],
        updateTime = json['updateTime'],
        images = (json['images'] as String).split('::');

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'content': content,
      'images': images.join('::'),
      'isDeleted': isDeleted,
      'isPublic': isPublic,
      'createTime': createTime,
      'updateTime': updateTime
    };
  }
}
