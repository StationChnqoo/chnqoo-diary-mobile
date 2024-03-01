import 'package:chnqoo_diary_mobile/constants/permission_check.dart';
import 'package:chnqoo_diary_mobile/constants/services.dart';
import 'package:chnqoo_diary_mobile/constants/states_provider.dart';
import 'package:chnqoo_diary_mobile/constants/x.dart';
import 'package:chnqoo_diary_mobile/routes/routes.dart';
import 'package:chnqoo_diary_mobile/widgets/my_app_bar.dart';
import 'package:chnqoo_diary_mobile/widgets/my_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  StatesProvider statesProvider = StatesProvider();
  List<PermissionCheck> datas = [];
  bool agree = false;
  TextEditingController controller = TextEditingController();

  onLoginPress() async {
    if (x.isMobile(controller.text)) {
      if (agree) {
        Get.toNamed(RoutesClass.SMS, arguments: {'mobile': controller.text});
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  '服务协议及隐私保护',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                content: Text('为了更好的保障您的合法权益，请您阅读并同意以下协议《用户注册协议》和《隐私政策》'),
                actions: [
                  CupertinoDialogAction(
                    child: Text(
                      '不同意',
                      style: TextStyle(color: Colors.black54),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text(
                      '同意',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      agree = true;
                      setState(() {});
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      }
    } else {
      x.useToast('目前仅支持中国大陆用户使用 ~');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppBar(title: '欢迎使用'),
      resizeToAvoidBottomInset: false,
      body: Consumer<StatesProvider>(
        builder: (context, value, child) {
          return Container(
            padding: EdgeInsets.all(12),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 6,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.network(
                    '${dotenv.get('CDN')}/logo-login.png',
                    height: 56.w,
                    width: 56.w,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '记了吗',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Chnqoo Notes',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Hi~ 欢迎使用记了吗",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                controller: controller,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: '请输入手机号码',
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
                height: 5,
              ),
              Text(
                "未注册的手机号将自动创建记了吗账号",
                style: TextStyle(fontSize: 12, color: Colors.black45),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => onLoginPress(),
                    child: Text('获取验证码'),
                    // style: ButtonStyle(
                    //   backgroundColor: MaterialStateProperty.all<Color>(
                    //       Theme.of(context).primaryColor.withOpacity(0.618)),
                    // ),
                  )),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyCheckBox(
                              value: agree,
                              onChanged: (checked) {
                                setState(() {
                                  agree = !agree;
                                });
                              }),
                          Text(
                            "阅读并同意《用户注册协议》和《隐私政策》",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black38),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                flex: 1,
              )
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
