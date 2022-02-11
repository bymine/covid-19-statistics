import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();

  Rx<int> currentIndex = 0.obs;

  changeIndex(index) {
    currentIndex(index);
  }
}
