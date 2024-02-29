import 'package:chnqoo_diary_mobile/constants/config.dart';
import 'package:chnqoo_diary_mobile/constants/drawer_menu.dart';
import 'package:chnqoo_diary_mobile/constants/states_provider.dart';
import 'package:chnqoo_diary_mobile/constants/x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SlideMenu extends StatefulWidget {
  SlideMenu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SlideMenuState();
}

class SlideMenuState extends State<SlideMenu> {
  StatesProvider statesProvider = StatesProvider();

  onMenuPress(DrawerMenu menu) {
    Get.toNamed(menu.id);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<StatesProvider>(builder: (build, states, child) {
      return Drawer(
          child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName:
                  Text(x.useAorB(statesProvider.account?['nickname'], '请登录 ~')),
              accountEmail: Text('笔记号码: ' +
                  (statesProvider.account?['idQoo']?.toString() ??
                      '登录后才能拥有 ~')),
              currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(36.w),
                  child: Image.network(
                    x.useAorB(statesProvider.account?['avatar'],
                        '${Config.CDN}/i.png'),
                    width: 72.w,
                    height: 72.w,
                  )),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      // colorFilter: ColorFilter.matrix(x.useGreyImageFilter()),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.38), BlendMode.darken),
                      fit: BoxFit.cover,
                      image: NetworkImage(states.bingWallPaper['image_url']))),
            ),
            Expanded(
                child: ListView(padding: EdgeInsets.zero, children: [
              Column(
                children: DrawerMenu.loadDrawerMenus()
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
              )
            ]))
          ],
        ),
      ));
    });
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
