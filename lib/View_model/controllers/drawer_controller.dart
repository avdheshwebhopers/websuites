import 'package:get/get.dart';

class SelectionController extends GetxController {
  var _selectedIndex = 0.obs;

  void changeSelected(int index) {
    _selectedIndex.value = index;
  }
}