import 'package:get/get.dart';

import '../controllers/tabf_controller.dart';

class TabFBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabFController>(
      () => TabFController(),
    );
  }
}
