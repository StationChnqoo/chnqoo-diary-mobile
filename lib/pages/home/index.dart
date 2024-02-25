import 'package:carousel_slider/carousel_slider.dart';
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
import 'package:chnqoo_diary_mobile/widgets/slide_menu.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  ScrollController? swiper;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  StatesProvider statesProvider = StatesProvider();

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
                    GestureDetector(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(22.w),
                        child: Image.network(
                          'https://blog.cctv3.net/i.jpg',
                          height: 44.w,
                          width: 44.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                      onTap: () => scaffoldKey.currentState?.openDrawer(),
                    ),
                  ],
                ),
              ))),
      body: Consumer<StatesProvider>(
        builder: (context, value, child) {
          return Container(
            child: ListView(
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
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      height: (MediaQuery.of(context).size.width - 32) * 0.25,
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
                                'https://cloud.cctv3.net/Staging/home-banner-${i}.jpg',
                                width: MediaQuery.of(context).size.width - 24,
                                height: double.maxFinite,
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                HomeNotes(),
                HomeTodos(),
                HomeDates(),
                HomeMotions(),
                HomeTopics(),
                HomeActivities(),
                Container(
                    margin: EdgeInsets.all(12),
                    child: Center(
                      child: Text(
                        '已经到底啦 ~',
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
        animationDuration: Duration(milliseconds: 618),
        childrenButtonSize: Size.fromRadius(24),
        childPadding: EdgeInsets.all(5),
        childMargin: EdgeInsets.symmetric(vertical: 10),
        // childPadding: EdgeInsets.all(0),
        children: [
          SpeedDialChild(
            label: '日记',
            child: Icon(
              Icons.auto_stories_outlined,
              color: Colors.black54,
            ),
          ),
          SpeedDialChild(
              label: '笔记',
              child: Icon(
                Icons.style_outlined,
                color: Colors.black54,
              )),
          SpeedDialChild(
            label: '心情',
            child: Icon(
              Icons.emoji_symbols_outlined,
              color: Colors.black54,
            ),
          ),
          SpeedDialChild(
            label: '纪念日',
            child: Icon(
              Icons.event_note_outlined,
              color: Colors.black54,
            ),
          ),
          SpeedDialChild(
            label: '代办事项',
            child: Icon(
              Icons.checklist_outlined,
              color: Colors.black54,
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  loadBingPicture() async {
    var dio = Dio();
    // dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        queryParameters: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        showProcessingTime: true,
        showCUrl: true,
        // canShowLog: kDebugMode,
      ),
    );
    var result = await dio.get(
        'https://mouday.github.io/wallpaper-database/${x.usePreviousDay(1)}.json');
    statesProvider.setBingWallPaper(result.data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    statesProvider = Provider.of<StatesProvider>(context, listen: false);
    loadBingPicture();
  }
}
