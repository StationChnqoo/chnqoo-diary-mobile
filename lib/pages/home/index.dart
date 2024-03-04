import 'package:carousel_slider/carousel_slider.dart';
import 'package:chnqoo_diary_mobile/constants/common_menu.dart';
import 'package:chnqoo_diary_mobile/constants/config.dart';
import 'package:chnqoo_diary_mobile/constants/get_stores.dart';
import 'package:chnqoo_diary_mobile/constants/services.dart';
import 'package:chnqoo_diary_mobile/constants/states_provider.dart';
import 'package:chnqoo_diary_mobile/constants/x.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/activities.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/dates.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/motions.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/notes.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/notice.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/search_bar.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/todos.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/topics.dart';
import 'package:chnqoo_diary_mobile/routes/routes.dart';
import 'package:chnqoo_diary_mobile/widgets/my_avatar.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:chnqoo_diary_mobile/widgets/slide_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  ScrollController? swiper;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  StatesProvider statesProvider = StatesProvider();

  onMinePress() {
    // Get.dialog(Text('呵呵'));
    if (statesProvider.account?['id'] == null) {
      Get.toNamed(RoutesClass.LOGIN);
    } else {
      scaffoldKey.currentState?.openDrawer();
    }
  }

  onFloatMenuPress(CommonMenu menu) {
    print("onFloatMenuPress: " + menu.page);
    Get.toNamed(menu.page);
  }

  @override
  Widget build(BuildContext context) {
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
                    Expanded(child: HomeSeachBar()),
                    SizedBox(
                      width: 12,
                    ),
                    MyAvatar(
                        url: statesProvider.account?['avatar'],
                        size: 44.w,
                        onPress: () {
                          onMinePress();
                        })
                  ],
                ),
              ))),
      body: Consumer<StatesProvider>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 6,
                ),
                HomeNotice(),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: MyCard(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          height:
                              (MediaQuery.of(context).size.width - 32) * 0.25,
                          viewportFraction: 0.66,
                          enlargeCenterPage: true,
                        ),
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    '${dotenv.get('CDN')}/home-banner-${i}.jpg',
                                    width:
                                        MediaQuery.of(context).size.width - 24,
                                    height: double.maxFinite,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    )),
                HomeNotes(),
                HomeTodos(),
                HomeDates(),
                HomeMotions(),
                HomeTopics(),
                HomeActivities(),
                Container(
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        'Env: ${dotenv.get('ENV')}',
                        style: TextStyle(color: Colors.black38, fontSize: 12),
                      ),
                    ))
              ],
            ),
          );
        },
      ),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  loadBingPicture() async {
    var result = await Services().selectBingWallPaper();
    statesProvider.setBingWallPaper(result.data);
  }

  initGetStores() {
    GetStores stores = Get.put(GetStores());
    ever(stores.homePage, (value) {
      x.usePrint('initGetStores: ', 'stores.homePage: ${value}');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    statesProvider = Provider.of<StatesProvider>(context, listen: false);
    loadBingPicture();
    initGetStores();
  }
}
