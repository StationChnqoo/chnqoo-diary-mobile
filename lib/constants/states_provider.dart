import 'package:chnqoo_diary_mobile/constants/config.dart';
import 'package:chnqoo_diary_mobile/constants/x.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

final DEFAULT_BING_WALL_PAPER = {
  "date": "2023-08-19",
  "headline": "我准备好拍特写了，松鼠先生",
  "title": "看着相机镜头的松鼠",
  "description":
      "1839年的8月19日，法国画家达盖尔公布了其发明的达盖尔摄影法，即银版摄影法，这被认为是最早的具有实用价值的摄影法。因此每年的8月19日被定位世界摄影日。摄影的世界是广阔的，专业人士和业余爱好者所涉足的摄影主题和风格也是多种多样的。无论是抽象还是时尚，抑或是风景和野生动物，都可以成为摄影的主题。图上这只厚脸皮的松鼠就是一个例子。尽管随着数码相机和智能手机的问世，达盖尔摄影法之类的老式摄影法早已过时，但却仍有一些摄影师还在竭力保持老式摄影的魅力和艺术性。",
  "image_url":
      "https://cn.bing.com/th?id=OHR.CameraSquirrel_ZH-CN3580119980_1920x1080.webp",
  "main_text": "世界上第一张照片是由法国科学家约瑟夫·尼塞福尔·涅普斯在1826年拍摄出来的。"
};

final DEFAULT_SETTING = {};

final DEFAULT_ACCOUNT = {'id': null};

class StatesProvider extends ChangeNotifier {
  bool isReadedCaches = false;
  dynamic bingWallPaper = DEFAULT_BING_WALL_PAPER;
  dynamic setting = DEFAULT_SETTING;
  dynamic account = DEFAULT_ACCOUNT;

  StatesProvider() {
    if (isReadedCaches) {
    } else {
      readCaches();
    }
  }

  void readCaches() async {
    // Obtain shared preferences.
    int start = DateTime.now().millisecondsSinceEpoch;
    var myBox = await Hive.openBox(Config.HIVE_BOX);
    var version = myBox.get('version');
    if (version == null || version != Config.HIVE_VERSION) {
      myBox.put("version", Config.HIVE_VERSION);
      Map<String, dynamic> variables = Map.from({
        'bingWallPaper': bingWallPaper,
        'setting': setting,
        'account': account,
      });
      myBox.putAll(variables);
      myBox.put('version', Config.HIVE_VERSION);
    }
    bingWallPaper = myBox.get('bingWallPaper');
    setting = myBox.get('setting');
    account = myBox.get('account');
    int end = DateTime.now().millisecondsSinceEpoch;
    x.usePrint(
      'StatesProvider: ',
      "Caches database initialized in ${end - start}ms.",
    );
    isReadedCaches = true;
    notifyListeners();
  }

  clearCaches() {}

  void writeCache(key, value) async {
    int start = DateTime.now().millisecondsSinceEpoch;
    var box = await Hive.openBox(Config.HIVE_BOX);
    await box.put(key, value);
    notifyListeners();
    int end = DateTime.now().millisecondsSinceEpoch;
    x.usePrint(
        'StatesProvider: ', "Caches database updated in ${end - start}ms.");
  }

  void setBingWallPaper(dynamic value) {
    bingWallPaper = value;
    writeCache('bingWallPaper', value);
  }

  void setAccount(dynamic value) {
    account = value;
    writeCache('account', value);
  }
}
