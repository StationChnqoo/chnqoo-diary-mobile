import 'dart:math';

import 'package:chnqoo_diary_mobile/constants/bing_wall_paper.dart';
import 'package:chnqoo_diary_mobile/constants/config.dart';
import 'package:chnqoo_diary_mobile/constants/get_stores.dart';
import 'package:chnqoo_diary_mobile/constants/services.dart';
import 'package:chnqoo_diary_mobile/constants/x.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/activities.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/banners.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/motions.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/notes.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/notice.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/todos.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomeMyPage extends StatefulWidget {
  const HomeMyPage({super.key});

  @override
  State<HomeMyPage> createState() => HomeMyPageState();
}

class HomeMyPageState extends State<HomeMyPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  ScrollController? swiper;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GetStores stores = Get.find<GetStores>();

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    return Container(
        // decoration: BoxDecoration(color: Color(0xfff6f8fa)),
        child: SingleChildScrollView(
            child: Column(
      children: [
        SizedBox(
          height: 6,
        ),
        HomeNotice(),
        Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
                horizontal: Config.PAGE_PADDING, vertical: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: MyCard(child: Banners())),
        HomeActivities(),
        SizedBox(
          height: 6,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: Config.PAGE_PADDING),
          child: MasonryGridView.count(
            itemCount: 20,
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            itemBuilder: (context, index) {
              int SIZE = 10;
              return Container(
                width: double.infinity,
                child: MyCard(
                    child: [
                  HomeTodos(),
                  HomeMotions(),
                  HomeNotes()
                ][Random().nextInt(3)]),
              );
            },
          ),
        ),
        SizedBox(
          height: 12,
        )
      ],
    )));
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
