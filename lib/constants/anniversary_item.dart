import 'package:chnqoo_diary_mobile/constants/x.dart';

class AnniversaryItem {
  String id;
  String title;
  String message;
  List<String> images;
  String happenedDate;
  String createTime;
  String updateTime;

  AnniversaryItem(
      {required this.id,
      required this.title,
      required this.message,
      required this.images,
      required this.happenedDate,
      required this.createTime,
      required this.updateTime});

  static buildDefaultAnniversaryItem() => AnniversaryItem(
      id: '',
      title: '',
      message: '',
      images: [],
      happenedDate: x.useDiffDate(0),
      createTime: x.useCurrentTime(),
      updateTime: x.useCurrentTime());
}
