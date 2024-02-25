import 'package:chnqoo_diary_mobile/pages/home/index.dart';
import 'package:chnqoo_diary_mobile/pages/login/index.dart';
import 'package:chnqoo_diary_mobile/pages/permission/index.dart';
import 'package:chnqoo_diary_mobile/pages/sms/index.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String HOME = "/";
  static String PERMISSION = "/permission";
  static String SMS = "/sms";
  static String LOGIN = "/login";

  static List<GetPage> routes = [
    GetPage(name: HOME, page: () => const HomePage()),
    GetPage(
        name: PERMISSION,
        page: () => const PermissionPage(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 360)),
    GetPage(
        name: SMS,
        page: () => const SmsPage(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 360)),
    GetPage(
        name: LOGIN,
        page: () => const LoginPage(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 360))
  ];
}
