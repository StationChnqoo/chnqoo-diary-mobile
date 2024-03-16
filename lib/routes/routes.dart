import 'package:chnqoo_diary_mobile/pages/app.dart';
import 'package:chnqoo_diary_mobile/pages/edit/anniversary/index.dart';
import 'package:chnqoo_diary_mobile/pages/edit/diary/index.dart';
import 'package:chnqoo_diary_mobile/pages/edit/motion/index.dart';
import 'package:chnqoo_diary_mobile/pages/edit/note/index.dart';
import 'package:chnqoo_diary_mobile/pages/edit/todo/index.dart';
import 'package:chnqoo_diary_mobile/pages/home/index.dart';
import 'package:chnqoo_diary_mobile/pages/list/anniversary/index.dart';
import 'package:chnqoo_diary_mobile/pages/list/diary/index.dart';
import 'package:chnqoo_diary_mobile/pages/list/motion/index.dart';
import 'package:chnqoo_diary_mobile/pages/list/note/index.dart';
import 'package:chnqoo_diary_mobile/pages/list/todo/index.dart';
import 'package:chnqoo_diary_mobile/pages/login/index.dart';
import 'package:chnqoo_diary_mobile/pages/permission/index.dart';
import 'package:chnqoo_diary_mobile/pages/sms/index.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String APP = "/app";
  static String HOME = "/";
  static String PERMISSION = "/permission";
  static String SMS = "/sms";
  static String LOGIN = "/login";
  static String EDIT_ANNIVERSARY = "/edit/anniversary";
  static String EDIT_DIARY = "/edit/diary";
  static String EDIT_MOTION = "/edit/motion";
  static String EDIT_NOTE = "/edit/note";
  static String EDIT_TODO = "/edit/todo";
  static String LIST_ANNIVERSARY = "/list/anniversary";
  static String LIST_DIARY = "/list/diary";
  static String LIST_MOTION = "/list/motion";
  static String LIST_NOTE = "/list/note";
  static String LIST_TODO = "/list/todo";

  static List<GetPage> routes = [
    GetPage(name: APP, page: () => App()),
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
    ),
    GetPage(
      name: LIST_ANNIVERSARY,
      page: () => const ListAnniversaryPage(),
    ),
    GetPage(
      name: LIST_DIARY,
      page: () => const ListDiaryPage(),
    ),
    GetPage(
      name: LIST_MOTION,
      page: () => const ListMotionPage(),
    ),
    GetPage(
      name: LIST_NOTE,
      page: () => const ListNotePage(),
    ),
    GetPage(
      name: LIST_TODO,
      page: () => const ListTodoPage(),
    )
  ];
}
