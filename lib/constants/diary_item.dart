import 'package:chnqoo_diary_mobile/constants/x.dart';

class DiaryItem {
  String id;
  String userId;
  String title;
  String message;
  List<String> images;
  String happenedDate;
  bool isDeleted;
  bool isPublic;
  String createTime;
  String updateTime;

  DiaryItem(
      {required this.id,
      required this.userId,
      required this.title,
      required this.message,
      required this.images,
      required this.happenedDate,
      required this.isDeleted,
      required this.isPublic,
      required this.createTime,
      required this.updateTime});

  static buildDiaryItem() => DiaryItem(
      id: '',
      userId: '',
      title: '',
      message: '',
      images: [],
      happenedDate: x.useDiffDate(0),
      isDeleted: false,
      isPublic: false,
      createTime: x.useCurrentTime(),
      updateTime: x.useCurrentTime());

  DiaryItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        title = json['title'],
        message = json['message'],
        happenedDate = json['happenedDate'],
        isDeleted = json['isDeleted'],
        isPublic = json['isPublic'],
        createTime = json['createTime'],
        updateTime = json['updateTime'],
        images = (json['images'] as String).split('::');

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'message': message,
      'images': images.join('::'),
      'happenedDate': happenedDate,
      'isDeleted': isDeleted,
      'isPublic': isPublic,
      'createTime': createTime,
      'updateTime': updateTime
    };
  }
}
