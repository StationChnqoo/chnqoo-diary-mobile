import 'package:chnqoo_diary_mobile/constants/config.dart';
import 'package:chnqoo_diary_mobile/constants/x.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

// Dio在原有返回的结构上包了一层data -> {data: {success: bool, data: map}}
class Services {
  Dio dio = Dio();
  // Services() : dio = Dio();
  Services() {
    int milliseconds = DateTime.now().millisecondsSinceEpoch;
    dio.options = BaseOptions(
        sendTimeout: Duration(seconds: 10),
        connectTimeout: Duration(seconds: 10),
        // http://192.168.0.102:21981/api/chnqoo-notebook
        baseUrl: Config.SERVER,
        headers: Map.from(
            {'t': milliseconds, 's': x.useMD5(milliseconds.toString())}));
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        queryParameters: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        showProcessingTime: true,
        showCUrl: true,
        canShowLog: true,
      ),
    );
  }

  selectBingWallPaper() async {
    var result = await Dio().get(
        'https://mouday.github.io/wallpaper-database/${x.usePreviousDay(1)}.json');
    return result;
  }

  selectTest() async {
    var result = await dio.get('/test');
    return result;
  }

  sendSms(String mobile) async {
    var result = await dio.post('/sms', data: Map.from({"mobile": mobile}));
    return result.data;
  }

  checkSms(String mobile, String code) async {
    var result = await dio.get("/sms",
        queryParameters: Map.from({"mobile": mobile, "code": code}));
    return result.data;
  }
}
