import 'package:chnqoo_diary_mobile/constants/diary_item.dart';
import 'package:chnqoo_diary_mobile/constants/get_stores.dart';
import 'package:chnqoo_diary_mobile/pages/edit/widgets/bottoms.dart';
import 'package:chnqoo_diary_mobile/pages/edit/widgets/date_selector.dart';
import 'package:chnqoo_diary_mobile/pages/edit/widgets/images_selector.dart';
import 'package:chnqoo_diary_mobile/pages/edit/widgets/public_selector.dart';
import 'package:chnqoo_diary_mobile/widgets/my_app_bar.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListDiaryPage extends StatefulWidget {
  const ListDiaryPage({super.key});

  @override
  State<StatefulWidget> createState() => ListDiaryPageState();
}

class ListDiaryPageState extends State<ListDiaryPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  DiaryItem diaryItem = DiaryItem.buildDiaryItem();
  GetStores stores = Get.find<GetStores>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: MyAppBar(title: '编辑日记'),
        resizeToAvoidBottomInset: false,
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  MyCard(
                      child: Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 6,
                        ),
                        TextField(
                          minLines: 1,
                          textAlignVertical: TextAlignVertical.top,
                          style: TextStyle(fontSize: 16),
                          onChanged: (value) {
                            diaryItem.title = value;
                            setState(() {});
                          },
                          decoration: InputDecoration(
                              // hintText: '简要备注 ...',
                              label: Text('请输入标题 ...'),
                              // contentPadding:
                              //     EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextField(
                          minLines: 1,
                          maxLines: 4,
                          // maxLength: 99,
                          textAlignVertical: TextAlignVertical.top,
                          style: TextStyle(fontSize: 16),
                          onChanged: (value) {
                            diaryItem.message = value;
                            setState(() {});
                          },
                          decoration: InputDecoration(
                              // hintText: '简要备注 ...',
                              label: Text('请展开说说 ...'),
                              // contentPadding:
                              //     EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                      ],
                    ),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  DateSelector(
                    date: diaryItem.happenedDate,
                    onDateChanged: (date) {
                      diaryItem.happenedDate = date;
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ImagesSelector(
                      images: diaryItem.images,
                      onUpload: (file) {
                        // onUploaded(file);
                      },
                      onDeleted: (file) {
                        // onDaleted(file);
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  PublicSelector(
                      isPublic: diaryItem.isPublic,
                      onPublicChanged: (value) {
                        diaryItem.isPublic = !diaryItem.isPublic;
                        setState(() {});
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  EditBottons(onDeletePress: () {}, onSavePress: () {}),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            )));
  }
}
