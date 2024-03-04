import 'dart:async';

import 'package:chnqoo_diary_mobile/constants/get_stores.dart';
import 'package:chnqoo_diary_mobile/constants/services.dart';
import 'package:chnqoo_diary_mobile/constants/user.dart';
import 'package:chnqoo_diary_mobile/widgets/my_app_bar.dart';
import 'package:chnqoo_diary_mobile/widgets/my_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmsPage extends StatefulWidget {
  const SmsPage({super.key});

  @override
  State<SmsPage> createState() => SmsPageState();
}

class SmsPageState extends State<SmsPage> with WidgetsBindingObserver {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GetStores stores = Get.find<GetStores>();
  TextEditingController smsEditor = TextEditingController();
  dynamic routeParams = Get.arguments;
  final SECONDS = 120;
  int seconds = 120;
  late Timer timer = Timer(Duration(milliseconds: 1), () {});

  onSendPress() async {
    if (seconds == 0) {
      setState(() {
        seconds = SECONDS;
      });
    }
    if (seconds == SECONDS) {
      var result = await Services().sendSms(routeParams['mobile']);
      if (result['success']) {
        MySnackBar(context: context).success('发送成功 ~');
      } else {}
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

  onSmsCodeChange(String value) async {
    print("onSmsCodeChange: ${value}");
    if (RegExp(r'^\d{6}$').hasMatch(smsEditor.text)) {
      var result =
          await Services().checkSms(routeParams['mobile'], smsEditor.text);
      if (result['success']) {
        stores.setUser(User.fromJson(result['data']));
        Get.back();
        Get.back();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: MyAppBar(title: ''),
        body: Container(
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
                      label: Text('请输入验证码 ...'),
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
                        onTap: () => onSendPress()),
                    GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            '收不到验证码？',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 14),
                          ),
                        ),
                        onTap: () {})
                  ],
                )
              ],
            )));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Sms page route params: ");
    print(routeParams);
    onSendPress();
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
