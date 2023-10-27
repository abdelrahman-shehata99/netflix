import 'package:get/get.dart';

class StartController extends GetxController {
  final xOffset = 0.0.obs;
  final yOffset = 0.0.obs;
  final scaleFactor = 1.0.obs;
  final verticalMargin = 0.0.obs;
  final isDrawerOpen = false.obs;
  void openDrawer() {
    xOffset.value = Get.size.width * 0.70;
    yOffset.value = 0;
    verticalMargin.value = 40;
    scaleFactor.value = 1;
    isDrawerOpen.value = true;
  }

  void closeDrawer() {
    if (isDrawerOpen.value) {
      xOffset.value = 0;
      yOffset.value = 0;
      verticalMargin.value = 0;
      scaleFactor.value = 1;
      isDrawerOpen.value = false;
    }
  }

  void toggleDrawer() {
    if (xOffset.value == 0) {
      openDrawer();
    } else {
      closeDrawer();
    }
  }
    onRefresh() async {
   
    }
  
}
