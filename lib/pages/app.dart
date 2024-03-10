import 'package:chnqoo_diary_mobile/pages/home/index.dart';
import 'package:chnqoo_diary_mobile/pages/login/index.dart';
import 'package:chnqoo_diary_mobile/pages/my/index.dart';
import 'package:chnqoo_diary_mobile/pages/new/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        // borderRadius: BorderRadius.circular(12),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 618),
        curve: Curves.ease,
      ),
      navBarStyle:
          NavBarStyle.style9, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [HomePage(), LoginPage(), NewPage(), LoginPage(), MyPage()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(context) {
    const icons = [
      CupertinoIcons.house_alt,
      Icons.emoji_symbols_outlined,
      Icons.drive_file_rename_outline,
      Icons.insert_invitation_outlined,
      CupertinoIcons.settings
    ];
    const titles = ['首页', '社区', '新建', '视频', '我的'];
    return List.generate(
        5,
        (index) => PersistentBottomNavBarItem(
              icon: Icon(
                icons[index],
                size: 24,
              ),
              title: (titles[index]),
              activeColorPrimary: Theme.of(context).primaryColor,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            ));
  }
}
