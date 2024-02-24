import 'package:bot_toast/bot_toast.dart';
import 'package:chnqoo_diary_mobile/constants/states_provider.dart';
import 'package:chnqoo_diary_mobile/constants/x.dart';
import 'package:chnqoo_diary_mobile/pages/home/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  // init Hive
  // final document = await getApplicationDocumentsDirectory();
  // Logger().d('App document dir: ${document.path}');
  Hive.init(await x.useDocumentPath());
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<StatesProvider>(
        create: (context) => StatesProvider()),
  ], child: const ChnqooDiaryMobile()));
}

class ChnqooDiaryMobile extends StatefulWidget {
  const ChnqooDiaryMobile({super.key});

  @override
  State<ChnqooDiaryMobile> createState() => ChnqooDiaryMobileState();
}

class ChnqooDiaryMobileState extends State<ChnqooDiaryMobile> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    ScreenUtil.init(context, designSize: const Size(375, 667));
    return MaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        Widget newWidget = Container();
        if (child == null) {
        } else {
          newWidget = MediaQuery(
            data: data.copyWith(textScaler: TextScaler.linear(1.0)),
            child: child,
          );
          newWidget = botToastBuilder(context, newWidget);
        }
        return newWidget;
      },
      home: const HomePage(title: 'StationChnqooDiaryMobile'),
    );
  }
}
