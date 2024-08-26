import 'package:get/get.dart';

class DrawerControllers extends GetxController {
  var isDrawerOpen = false.obs;

  void openDrawer() {
    isDrawerOpen.value = true;
  }

  void closeDrawer() {
    isDrawerOpen.value = false;
  }
}
