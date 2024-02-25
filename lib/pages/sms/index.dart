import 'package:chnqoo_diary_mobile/constants/permission_check.dart';
import 'package:chnqoo_diary_mobile/constants/states_provider.dart';
import 'package:chnqoo_diary_mobile/constants/x.dart';
import 'package:chnqoo_diary_mobile/widgets/my_app_bar.dart';
import 'package:chnqoo_diary_mobile/widgets/my_switcher.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class SmsPage extends StatefulWidget {
  const SmsPage({super.key});

  @override
  State<SmsPage> createState() => SmsPageState();
}

class SmsPageState extends State<SmsPage> with WidgetsBindingObserver {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  StatesProvider statesProvider = StatesProvider();
  List<PermissionCheck> datas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppBar(title: '权限设置'),
      body: Consumer<StatesProvider>(
        builder: (context, value, child) {
          return Container(
            child: ListView(children: [
              SizedBox(
                height: 6,
              ),
              ...datas
                  .map((e) => Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        margin:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54),
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ]),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    statesProvider = Provider.of<StatesProvider>(context, listen: false);
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
