import 'package:chnqoo_diary_mobile/constants/config.dart';
import 'package:chnqoo_diary_mobile/constants/permission_check.dart';
import 'package:chnqoo_diary_mobile/constants/x.dart';
import 'package:chnqoo_diary_mobile/widgets/my_app_bar.dart';
import 'package:chnqoo_diary_mobile/widgets/my_switcher.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => PermissionPageState();
}

class PermissionPageState extends State<PermissionPage>
    with WidgetsBindingObserver {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<PermissionCheck> datas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: MyAppBar(title: '权限设置'),
        body: Container(
          child: ListView(children: [
            SizedBox(
              height: 6,
            ),
            ...datas
                .map((e) => Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Config.PAGE_PADDING, vertical: 6),
                      margin: EdgeInsets.symmetric(
                          horizontal: Config.PAGE_PADDING, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e.title,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black87),
                              ),
                              MySwitcher(
                                  value: e.isOpened,
                                  onChanged: (value) {
                                    openAppSettings();
                                  })
                            ],
                          ),
                          Text(
                            e.message,
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                          )
                        ],
                      ),
                    ))
                .toList(),
          ]),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPermissions();
    WidgetsBinding.instance.addObserver(this);
  }

  isPermissionChecked(PermissionStatus status) {
    return status.isLimited || status.isGranted;
  }

  checkPermissions() async {
    datas = [
      PermissionCheck(
          title: '相册',
          message: '当你使用编写日记、笔记，发布话题等服务时，我们将向你申请相册权限',
          isOpened: await x.checkPhotoPermission()),
      PermissionCheck(
          title: '位置',
          message: '当你使用编写日记、笔记，发布话题等服务时，我们将向你申请位置权限',
          isOpened: await Permission.location.isGranted ||
              await Permission.location.isLimited),
      PermissionCheck(
          title: '麦克风',
          message: '当你使用编写日记、笔记等服务时，我们将向你申请麦克风权限',
          isOpened: await Permission.microphone.isGranted),
    ];
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    print('Permisson page status: ${state}');
    if (state == AppLifecycleState.resumed) {
      checkPermissions();
    }
  }
}
