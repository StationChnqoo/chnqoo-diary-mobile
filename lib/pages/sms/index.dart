import 'dart:async';

import 'package:chnqoo_diary_mobile/constants/permission_check.dart';
import 'package:chnqoo_diary_mobile/constants/states_provider.dart';
import 'package:chnqoo_diary_mobile/constants/x.dart';
import 'package:chnqoo_diary_mobile/widgets/my_app_bar.dart';
import 'package:chnqoo_diary_mobile/widgets/my_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  TextEditingController smsEditor = TextEditingController();
  dynamic routeParams = Get.arguments;
  int seconds = 60;
  late Timer timer;

  onSendSMSPress() {
    if (seconds == 0) {
      setState(() {
        seconds = 60;
      });
    }
    if (seconds == 60) {
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (seconds == 0) {
          timer.cancel();
        } else {
          seconds--;
        }
        setState(() {});
      });
    }
  }

  onSmsCodeChange(String value) {
    print("onSmsCodeChange: ${value}");
    if (value == '1234') {
      Get.back();
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppBar(title: ''),
      body: Consumer<StatesProvider>(
        builder: (context, value, child) {
          return Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "请输入验证码",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '验证码已通过短信发送到${routeParams?['mobile']}',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextField(
                    controller: smsEditor,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      onSmsCodeChange(value);
                    },
                    decoration: InputDecoration(
                        hintText: '请输入验证码',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(width: 1)),
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                        )),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              '${seconds == 0 ? '重新发送' : '${seconds}秒后重新发送'}',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14),
                            ),
                          ),
                          onTap: () => onSendSMSPress()),
                      GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              '收不到验证码？',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 14),
                            ),
                          ),
                          onTap: () {})
                    ],
                  )
                ],
              ));
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Sms page route params: ");
    print(routeParams);
    statesProvider = Provider.of<StatesProvider>(context, listen: false);
    onSendSMSPress();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    timer.cancel();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
  }
}
