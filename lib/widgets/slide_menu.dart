import 'package:chnqoo_diary_mobile/constants/common_menu.dart';
import 'package:chnqoo_diary_mobile/constants/config.dart';
import 'package:chnqoo_diary_mobile/constants/get_stores.dart';
import 'package:chnqoo_diary_mobile/widgets/my_avatar.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
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
      decoration: BoxDecoration(),
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
              child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: Config.PAGE_PADDING),
            child: Column(children: [
              SizedBox(
                height: 12,
              ),
              MyCard(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '我的空间',
                        style: TextStyle(color: Colors.black87, fontSize: 16),
                      ),
                      Text(
                        '52.89MB / 10GB',
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  LinearProgressIndicator(
                    value: 0.58,
                    minHeight: 4,
                  )
                ],
              )),
              SizedBox(
                height: 12,
              ),
              MyCard(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '常用设置',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ...CommonMenu.loadSlidePopularMenus().map((e) => Flexible(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Icon(
                                    e.icon,
                                    color: Theme.of(context).primaryColor,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    e.name,
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          )))
                    ],
                  )
                ],
              )),
              SizedBox(
                height: 12,
              ),
              MyCard(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '其他设置',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // decoration: BoxDecoration(color: Colors.amber),
                    child: GridView.count(
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      children: [
                        ...CommonMenu.loadSlideOtherMenus()
                            .map((e) => Container(
                                    child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Icon(
                                          e.icon,
                                          color: Theme.of(context).primaryColor,
                                          size: 24,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          e.name,
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                )))
                      ],
                    ),
                  )
                ],
              )),
              SizedBox(
                height: 32,
              ),
            ]),
          ))
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
