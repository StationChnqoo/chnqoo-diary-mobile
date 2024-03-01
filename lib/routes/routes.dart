import 'package:chnqoo_diary_mobile/pages/edit/anniversary/index.dart';
import 'package:chnqoo_diary_mobile/pages/edit/diary/index.dart';
import 'package:chnqoo_diary_mobile/pages/edit/motion/index.dart';
import 'package:chnqoo_diary_mobile/pages/edit/note/index.dart';
import 'package:chnqoo_diary_mobile/pages/edit/todo/index.dart';
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
  static String EDIT_ANNIVERSARY = "/edit/anniversary";
  static String EDIT_DIARY = "/edit/diary";
  static String EDIT_MOTION = "/edit/motion";
  static String EDIT_NOTE = "/edit/note";
  static String EDIT_TODO = "/edit/todo";

  static List<GetPage> routes = [
    GetPage(name: HOME, page: () => const HomePage()),
    GetPage(
      name: PERMISSION,
      page: () => const PermissionPage(),
    ),
    GetPage(
      name: SMS,
      page: () => const SmsPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: LOGIN,
      page: () => const LoginPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: EDIT_ANNIVERSARY,
      page: () => const EditAnniversaryPage(),
    ),
    GetPage(
      name: EDIT_DIARY,
      page: () => const EditDiaryPage(),
    ),
    GetPage(
      name: EDIT_MOTION,
      page: () => const EditMotionPage(),
    ),
    GetPage(
      name: EDIT_NOTE,
      page: () => const EditNotePage(),
    ),
    GetPage(
      name: EDIT_TODO,
      page: () => const EditTodoPage(),
    )
  ];
}
