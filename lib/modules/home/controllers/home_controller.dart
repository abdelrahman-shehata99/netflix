import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/modules/tabF/controllers/tabf_controller.dart';

class HomeController extends GetxController {
  late PageController pageController;
  RxInt currentPage = 0.obs; // Using RxInt for reactive updates

  void goToTap(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  @override
  void onInit() {
    Get.lazyPut(() => TabFController());
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {}
}
