import 'package:chnqoo_diary_mobile/pages/home/index.dart';
import 'package:chnqoo_diary_mobile/pages/permission/index.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String HOME = "/";
  static String PERMISSION = "/permission";

  static List<GetPage> routes = [
    GetPage(name: HOME, page: () => const HomePage()),
    GetPage(
        name: PERMISSION,
        page: () => const PermissionPage(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 618))
  ];
}