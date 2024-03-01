import 'package:bot_toast/bot_toast.dart';
import 'package:chnqoo_diary_mobile/constants/config.dart';
import 'package:chnqoo_diary_mobile/constants/states_provider.dart';
import 'package:chnqoo_diary_mobile/constants/x.dart';
import 'package:chnqoo_diary_mobile/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  String env = Config.useConfigDotenvFile(Config.APP_PACKAGE_NAME);
  await dotenv.load(fileName: env);
  // init Hive
  // final document = await getApplicationDocumentsDirectory();
  // Logger().d('App document dir: ${document.path}');
  Hive.init(await x.useDocumentPath());
  outPrintln();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<StatesProvider>(
        create: (context) => StatesProvider()),
  ], child: const ChnqooDiaryMobile()));
}

outPrintln() {
  print("Build command line params: ");
  print("--> " + Config.APP_PACKAGE_NAME);
  print("--> " + Config.APP_NAME);
  print("--> " + dotenv.get("ENV"));
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
    return GetMaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
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
      initialRoute: RoutesClass.HOME,
      getPages: RoutesClass.routes,
      defaultTransition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 360),
    );
  }
}
