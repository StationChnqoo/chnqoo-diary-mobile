import 'package:flutter/material.dart';

class DrawerMenu {
  String id;
  String name;
  IconData icon;

  DrawerMenu({required this.id, required this.name, required this.icon});

  static List<DrawerMenu> loadDrawerMenus() {
    return [
      DrawerMenu(id: 'account', name: '账号设置', icon: Icons.fingerprint),
      DrawerMenu(id: 'bug', name: '意见征集', icon: Icons.bug_report_outlined),
      DrawerMenu(id: 'about', name: '关于我们', icon: Icons.highlight_alt),
      DrawerMenu(
          id: 'upgrade', name: '版本升级', icon: Icons.rocket_launch_outlined),
      DrawerMenu(id: 'evaluate', name: '评价管理', icon: Icons.commute_outlined),
      DrawerMenu(
          id: 'dislike', name: '屏蔽司机', icon: Icons.thumb_down_alt_outlined),
      DrawerMenu(id: 'rule', name: '平台规则', icon: Icons.rule),
      DrawerMenu(id: 'donate', name: '捐赠支持', icon: Icons.card_giftcard_outlined),
      DrawerMenu(id: 'role', name: '切换身份', icon: Icons.swipe_vertical_outlined),
      DrawerMenu(id: 'exit', name: '退出登录', icon: Icons.settings_power)
    ];
  }
}