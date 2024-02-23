import 'dart:convert';
import 'dart:math';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class x {
  static useCDN(String url, int width) {
    return '${url}?x-oss-process=image/resize,w_${width * 2}';
  }

  static Color useRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  static usePreviousDay(int days) {
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(Duration(days: days));
    String formattedDate =
        "${yesterday.year}/${yesterday.month.toString().padLeft(2, '0')}/${yesterday.day.toString().padLeft(2, '0')}";
    return formattedDate;
  }

  static useGreyImageFilter() {
    return [
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ];
  }

  static useToast(String text) {
    BotToast.showText(
        text: text,
        animationDuration: const Duration(milliseconds: 618),
        contentColor: const Color.fromRGBO(0, 0, 0, 0.68),
        textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(16));
  }

  static isNull(dynamic s) {
    return s == null || s.isEmpty || s.trim().isEmpty;
  }

  static useDeepClone(dynamic object) {
    return json.decode(json.decode(object));
  }

  static useAddress2String(dynamic address) {
    List datas =
        [address['province'], address['city'], address['area']].toList();
    return datas
        .map((e) {
          return e == null ? '' : e['name'];
        })
        .toList()
        .join('');
  }

  static usePrint(String title, dynamic message) {
    String timestamp = DateTime.now().toString();
    String? fileName;
    int? lineNumber;
    // print(stackTrace.toString());
    // if (stackTrace != null) {
    //   fileName =
    //       stackTrace.toString().split("\n")[1].split("(")[1].split(")")[0];
    //   lineNumber =
    //       int.parse(stackTrace.toString().split("\n")[1].split(":")[1]);
    // }
    print('$timestamp: $title');
    print('$timestamp: $message');
  }

  static useDocumentPath() async {
    String dir = "./";
    if (GetPlatform.isWeb) {
    } else {
      var folder = await getApplicationDocumentsDirectory();
      dir = folder.path;
    }
    return dir;
  }
}
