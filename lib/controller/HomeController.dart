import 'package:get/state_manager.dart';

class Homecontroller extends GetxController {
  var currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
