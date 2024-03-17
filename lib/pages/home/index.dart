import 'package:chnqoo_diary_mobile/constants/bing_wall_paper.dart';
import 'package:chnqoo_diary_mobile/constants/common_menu.dart';
import 'package:chnqoo_diary_mobile/constants/get_stores.dart';
import 'package:chnqoo_diary_mobile/constants/services.dart';
import 'package:chnqoo_diary_mobile/constants/x.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/my_page.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/search_bar.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/social_page.dart';
import 'package:chnqoo_diary_mobile/widgets/my_avatar.dart';
import 'package:chnqoo_diary_mobile/widgets/slide_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  ScrollController? swiper;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GetStores stores = Get.find<GetStores>();

  onMinePress() {
    scaffoldKey.currentState?.openDrawer();
    // if (x.isNull(stores.user.value.id)) {
    //   Get.toNamed(RoutesClass.LOGIN);
    // } else {
    //   scaffoldKey.currentState?.openDrawer();
    // }
  }

  onFloatMenuPress(CommonMenu menu) {
    print("onFloatMenuPress: " + menu.page);
    Get.toNamed(menu.page);
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          automaticallyImplyLeading: false,
          leading: null,
          elevation: 12,
          shadowColor: Colors.black.withOpacity(.618),
          flexibleSpace: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top, left: 12, right: 12),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Color(0x3ab54b).withOpacity(0.58),
                    Color(0x8ec541).withOpacity(0.88),
                  ])),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 84.w,
                      child: TabBar(
                        dividerHeight: 0,
                        labelPadding: EdgeInsets.symmetric(horizontal: 2),
                        controller: _tabController,
                        tabs: [
                          ...['我的', '社区'].map((e) => Tab(
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ))
                        ],
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white70,
                        // add it here
                        // indicator: MaterialIndicator(
                        //   color: Colors.white,
                        //   bottomLeftRadius: 5,
                        //   bottomRightRadius: 5,
                        //   horizontalPadding: 4,
                        //   paintingStyle: PaintingStyle.fill,
                        // ),
                        indicator: DotIndicator(
                          color: Colors.white,
                          distanceFromCenter: 16,
                          paintingStyle: PaintingStyle.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(child: HomeSeachBar()),
                    SizedBox(
                      width: 12,
                    ),
                    MyAvatar(
                        url: stores.user.value.avatar,
                        size: 36.w,
                        onPress: () {
                          onMinePress();
                        })
                  ],
                ),
              ))),
      body: TabBarView(
          controller: _tabController,
          children: [HomeMyPage(), HomeSocialPage(), Container()]),
      drawer: SlideMenu(),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animationDuration: Duration(milliseconds: 361),
        childrenButtonSize: Size.fromRadius(24),
        childPadding: EdgeInsets.all(5),
        childMargin: EdgeInsets.symmetric(vertical: 10),
        // childPadding: EdgeInsets.all(0),
        children: [
          ...CommonMenu.loadFloatingMenus()
              .map(
                (e) => SpeedDialChild(
                    label: e.name,
                    child: Icon(
                      e.icon,
                      color: Colors.black54,
                    ),
                    onTap: () {
                      onFloatMenuPress(e);
                    }),
              )
              .toList()
        ],
      ),
    );
  }

  loadBingPicture() async {
    var result = await Services().selectBingWallPaper();
    stores.setBingWallPaper(BingWallPaper.fromJson(result.data));
  }

  initGetStores() {
    ever(stores.homePage, (value) {
      x.usePrint('initGetStores: ', 'stores.homePage: ${value}');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadBingPicture();
    initGetStores();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;
}
