import 'package:chnqoo_diary_mobile/constants/common_menu.dart';
import 'package:chnqoo_diary_mobile/constants/get_stores.dart';
import 'package:chnqoo_diary_mobile/widgets/my_avatar.dart';
import 'package:chnqoo_diary_mobile/widgets/my_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SlideMenu extends StatefulWidget {
  SlideMenu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SlideMenuState();
}

class SlideMenuState extends State<SlideMenu> {
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
    return Drawer(
        child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            accountName: Obx(() => Text(stores.user.value.nickname)),
            accountEmail: Obx(() => Text('笔记号码: ' + stores.user.value.idQoo)),
            currentAccountPicture: MyAvatar(
                url: stores.user.value.avatar, size: 72.w, onPress: () {}),
            decoration: BoxDecoration(
                image: DecorationImage(
                    // colorFilter: ColorFilter.matrix(x.useGreyImageFilter()),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.38), BlendMode.darken),
                    fit: BoxFit.cover,
                    image: NetworkImage(stores.bingWallPaper.value.image_url))),
          ),
          Expanded(
              child: ListView(padding: EdgeInsets.zero, children: [
            Column(
              children: CommonMenu.loadDrawerMenus()
                  .map((e) => Material(
                        child: ListTile(
                          splashColor: Color.fromRGBO(0, 0, 0, 0.08),
                          leading: Icon(e.icon),
                          title: Text(e.name),
                          tileColor: Colors.white,
                          onTap: () => onMenuPress(e),
                          minVerticalPadding: 5,
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: MyOutlineButton(
                  onPress: onLoginOutPress,
                  text: '退出登录',
                  icon: Icon(Icons.power_off_outlined)),
            ),
            SizedBox(
              height: 32,
            ),
          ]))
        ],
      ),
    ));
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
