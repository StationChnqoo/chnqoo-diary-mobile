import 'package:shared_preferences/shared_preferences.dart';

class Stores {
  static String ID = 'ID';
  Stores() {}

  set(String key, dynamic s) async {
    var store = await SharedPreferences.getInstance();
    await store.setString(key, s);
  }

  get(String key) async {
    var store = await SharedPreferences.getInstance();
    return store.getString(key) ?? '';
  }
}