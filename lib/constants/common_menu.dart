import 'package:chnqoo_diary_mobile/routes/routes.dart';
import 'package:flutter/material.dart';

class CommonMenu {
  String id;
  String name;
  IconData icon;
  String page;

  CommonMenu(
      {required this.id,
      required this.name,
      required this.icon,
      required this.page});

  static List<CommonMenu> loadSlidePopularMenus() {
    return [
      CommonMenu(
          id: 'account', name: '账号设置', icon: Icons.fingerprint, page: ''),
      CommonMenu(
          id: 'upgrade',
          name: '版本升级',
          icon: Icons.rocket_launch_outlined,
          page: ''),
      CommonMenu(
          id: RoutesClass.PERMISSION,
          name: '权限管理',
          icon: Icons.vpn_key,
          page: ''),
      CommonMenu(
          id: 'role',
          name: '切换身份',
          icon: Icons.swipe_vertical_outlined,
          page: ''),
    ];
  }

  static List<CommonMenu> loadSlideOtherMenus() {
    return [
      CommonMenu(
          id: 'bug', name: '意见征集', icon: Icons.bug_report_outlined, page: ''),
      CommonMenu(
          id: 'about', name: '关于我们', icon: Icons.highlight_alt, page: ''),
      CommonMenu(
          id: 'upgrade',
          name: '版本升级',
          icon: Icons.rocket_launch_outlined,
          page: ''),
      CommonMenu(
          id: 'evaluate', name: '评价管理', icon: Icons.commute_outlined, page: ''),
      CommonMenu(id: 'rule', name: '平台规则', icon: Icons.rule, page: ''),
      CommonMenu(
          id: 'donate',
          name: '捐赠支持',
          icon: Icons.card_giftcard_outlined,
          page: '')
    ];
  }

  static List<CommonMenu> loadFloatingMenus() {
    return [
      CommonMenu(
          id: '',
          name: '日记',
          icon: Icons.auto_stories_outlined,
          page: RoutesClass.EDIT_DIARY),
      CommonMenu(
          id: '',
          name: '心情',
          icon: Icons.emoji_symbols_outlined,
          page: RoutesClass.EDIT_MOTION),
      CommonMenu(
          id: '',
          name: '笔记',
          icon: Icons.style_outlined,
          page: RoutesClass.EDIT_NOTE),
      CommonMenu(
          id: '',
          name: '大事',
          icon: Icons.event_note_outlined,
          page: RoutesClass.EDIT_ANNIVERSARY),
      CommonMenu(
          id: '',
          name: '代办',
          icon: Icons.checklist_outlined,
          page: RoutesClass.EDIT_TODO)
    ];
  }
}
