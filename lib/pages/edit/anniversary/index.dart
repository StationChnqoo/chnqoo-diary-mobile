import 'dart:developer';

import 'package:chnqoo_diary_mobile/constants/anniversary_item.dart';
import 'package:chnqoo_diary_mobile/constants/services.dart';
import 'package:chnqoo_diary_mobile/constants/states_provider.dart';
import 'package:chnqoo_diary_mobile/constants/stores.dart';
import 'package:chnqoo_diary_mobile/constants/x.dart';
import 'package:chnqoo_diary_mobile/pages/edit/widgets/bottoms.dart';
import 'package:chnqoo_diary_mobile/pages/edit/widgets/date_selector.dart';
import 'package:chnqoo_diary_mobile/pages/edit/widgets/images_selector.dart';
import 'package:chnqoo_diary_mobile/pages/edit/widgets/public_selector.dart';
import 'package:chnqoo_diary_mobile/widgets/my_app_bar.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:chnqoo_diary_mobile/widgets/my_filled_button.dart';
import 'package:chnqoo_diary_mobile/widgets/my_outline_button.dart';
import 'package:chnqoo_diary_mobile/widgets/my_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  onUploaded(String file) async {
    var result = await Services().upload(
        statesProvider.account['id'], statesProvider.account['idQoo'], file);
    if (result['success']) {
      MySnackBar(context: context)
          .success('上传成功 ~\n${(result['data'] as String).split('/').last}');
      anniversary.images.add(result['data']);
      setState(() {});
    } else {
      MySnackBar(context: context).error(result['message']);
    }
  }

  onDaleted(String file) async {
    bool result = anniversary.images.remove(file);
    if (result) {
      MySnackBar(context: context).success('删除成功 ~ \n${file.split('/').last}');
    }
    setState(() {});
  }

  onSubmitPress() async {
    if (x.isNull(anniversary.title) || anniversary.title.length < 6) {
      MySnackBar(context: context).error("描述事件不能少于6个汉字 ~");
    } else {
      var result = await Services().editAnniversary(anniversary);
      if (result['success']) {
        MySnackBar(context: context).success('保存成功');
        Get.back();
      } else {
        MySnackBar(context: context).error(result['message']);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppBar(title: '编辑纪念日'),
      resizeToAvoidBottomInset: false,
      body: Consumer<StatesProvider>(
        builder: (context, value, child) {
          return Container(
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
                              anniversary.title = value;
                              setState(() {});
                            },
                            decoration: InputDecoration(
                                // hintText: '简要备注 ...',
                                label: Text('请描述事件 ...'),
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
                              anniversary.message = value;
                              setState(() {});
                            },
                            decoration: InputDecoration(
                                // hintText: '简要备注 ...',
                                label: Text('请发表感想 ...'),
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
                      date: anniversary.happenedDate,
                      onDateChanged: (date) {
                        anniversary.happenedDate = date;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImagesSelector(
                        images: anniversary.images,
                        onUpload: (file) {
                          onUploaded(file);
                        },
                        onDeleted: (file) {
                          onDaleted(file);
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    PublicSelector(
                        isPublic: anniversary.isPublic,
                        onPublicChanged: (value) {
                          anniversary.isPublic = !anniversary.isPublic;
                          setState(() {});
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    EditBottons(
                        onDeletePress: () {}, onSavePress: onSubmitPress),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ));
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initUserId();
  }

  void initUserId() async {
    if (x.isNull(anniversary.userId)) {
      anniversary.userId = await Stores().get(Stores.ID);
      print('anniversary.userId: ${await Stores().get(Stores.ID)}');
      setState(() {});
    }
  }
}
