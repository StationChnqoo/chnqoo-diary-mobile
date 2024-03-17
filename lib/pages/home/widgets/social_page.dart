import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chnqoo_diary_mobile/constants/bing_wall_paper.dart';
import 'package:chnqoo_diary_mobile/constants/config.dart';
import 'package:chnqoo_diary_mobile/constants/get_stores.dart';
import 'package:chnqoo_diary_mobile/constants/services.dart';
import 'package:chnqoo_diary_mobile/constants/x.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/activities.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/motions.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/notes.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/notice.dart';
import 'package:chnqoo_diary_mobile/pages/home/widgets/todos.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomeSocialPage extends StatefulWidget {
  const HomeSocialPage({super.key});

  @override
  State<HomeSocialPage> createState() => HomeSocialPageState();
}

class HomeSocialPageState extends State<HomeSocialPage>
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
      children: [],
    )));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;
}