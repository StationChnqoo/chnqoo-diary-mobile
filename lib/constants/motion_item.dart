import 'package:chnqoo_diary_mobile/constants/x.dart';

class MotionItem {
  String id;
  String userId;
  String content;
  String emoji;
  List<String> images;
  bool isDeleted;
  bool isPublic;
  String createTime;
  String updateTime;

  MotionItem(
      {required this.id,
      required this.userId,
      required this.content,
      required this.emoji,
      required this.images,
      required this.isDeleted,
      required this.isPublic,
      required this.createTime,
      required this.updateTime});

  static buildDefaultMotionItem() => MotionItem(
      id: '',
      userId: '',
      content: '',
      emoji: '吃瓜.png',
      images: [],
      isDeleted: false,
      isPublic: false,
      createTime: x.useCurrentTime(),
      updateTime: x.useCurrentTime());

  MotionItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        content = json['content'],
        emoji = json['emoji'],
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
      'emoji': emoji,
      'images': images.join('::'),
      'isDeleted': isDeleted,
      'isPublic': isPublic,
      'createTime': createTime,
      'updateTime': updateTime
    };
  }
}
