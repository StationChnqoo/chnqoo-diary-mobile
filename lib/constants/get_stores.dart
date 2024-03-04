import 'package:get/get.dart';

class GetStores extends GetxController {
  var id = '';
  var homePage = 0.obs;
  void refreshHomePage() {
    homePage.value++;
  }
}