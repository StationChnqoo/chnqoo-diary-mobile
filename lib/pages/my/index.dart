import 'package:cached_network_image/cached_network_image.dart';
import 'package:chnqoo_diary_mobile/constants/common_menu.dart';
import 'package:chnqoo_diary_mobile/constants/get_stores.dart';
import 'package:chnqoo_diary_mobile/widgets/my_avatar.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:chnqoo_diary_mobile/widgets/my_list_tile.dart';
import 'package:chnqoo_diary_mobile/widgets/my_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyPage extends StatefulWidget {
  MyPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  GetStores stores = Get.find<GetStores>();

  onMenuPress(CommonMenu menu) {
    Get.toNamed(menu.id);
  }

  onLoginOutPress() {
    stores.clearUser();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 9 / 16,
            width: double.infinity,
            padding: EdgeInsets.only(top: 44),
            decoration: BoxDecoration(
                image: DecorationImage(
                    // colorFilter: ColorFilter.matrix(x.useGreyImageFilter()),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.38), BlendMode.darken),
                    fit: BoxFit.fitWidth,
                    image: CachedNetworkImageProvider(
                        stores.bingWallPaper.value.image_url))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => MyAvatar(
                      url: stores.user.value.avatar,
                      size: 66.w,
                      onPress: () {})),
                  SizedBox(
                    height: 4,
                  ),
                  Obx(() => Text(
                        stores.user.value.nickname,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  Obx(() => Text('笔记号码: ' + stores.user.value.idQoo,
                      style: TextStyle(fontSize: 14, color: Colors.white))),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      child: MyCard(
                          child: Column(
                        children: [
                          ...CommonMenu.loadDrawerMenus()
                              .map((e) =>
                                  MyListTile(menu: e, onPress: onMenuPress))
                              .toList(),
                        ],
                      )),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 16),
                    //   child: MyOutlineButton(
                    //       onPress: onLoginOutPress,
                    //       text: '退出登录',
                    //       icon: Icon(Icons.power_off_outlined)),
                    // ),
                    SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
