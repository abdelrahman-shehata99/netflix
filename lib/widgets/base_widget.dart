import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/modules/start/controllers/start_controller.dart';
import 'package:netflix/modules/start/views/start_view.dart';
import 'package:netflix/modules/my_drawer/controllers/my_drawer_controller.dart';
import 'package:netflix/modules/my_drawer/views/my_drawer_view.dart';


class BaseWidget extends StatelessWidget {
  const BaseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(StartController());
    Get.put(MyDrawerController());
    return Scaffold(
      body: Stack(
        children: [
          MyDrawerView(),
          StartView(),
        ],
      ),
    );
  }
}


