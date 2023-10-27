import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/modules/start/controllers/start_controller.dart';
import 'package:netflix/routes/app_pages.dart';

class StartView extends GetView<StartController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
        onTap: () => controller.closeDrawer(),
        onPanStart: (details) {
          controller.toggleDrawer();
        },
        child: AnimatedContainer(
            margin:
                EdgeInsets.symmetric(vertical: controller.verticalMargin.value),
            transform: Matrix4.translationValues(
                controller.xOffset.value, controller.yOffset.value, 0)
              ..scale(controller.scaleFactor.value)
              ..rotateY(controller.isDrawerOpen.value ? -0.5 : 0),
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    controller.isDrawerOpen.value ? 40 : 0.0)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    controller.isDrawerOpen.value ? 40 : 0.0),
                child: GetBuilder<StartController>(
                    id: "StartBuilder",
                    builder: (_) {
                      return Scaffold(
                        body: Stack(
                          children: [
                            Container(
                              height: double.infinity,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image: NetworkImage(
                                          'https://assets.nflxext.com/ffe/siteui/vlv3/893a42ad-6a39-43c2-bbc1-a951ec64ed6d/4066d46f-c5f2-4fde-9276-f0ccf4f4b471/EG-en-20231002-popsignuptwoweeks-perspective_alpha_website_large.jpg'))),
                            ),
                            AppBar(
                              leading: const Image(
                                image: AssetImage('assets/images/netIcon.png'),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(0, 255, 193, 7),
                              actions: [
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'PRIVACY',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Get.toNamed(Routes.LOGIN);
                                    },
                                    child: const Text(
                                      'SIGN IN',
                                      style: TextStyle(color: Colors.white),
                                    ))
                              ],
                            ),
                            const Positioned(
                                top: 300,
                                left: 90,
                                child: Text(
                                  'Unlimited films,\n TV programmes \n & more',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                )),
                            const Positioned(
                                top: 420,
                                left: 90,
                                child: Text(
                                  'Watch anywhere. Cancel at any\n time.',
                                  style: TextStyle(color: Colors.white),
                                )),
                            Positioned(
                              top: 500,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.HOME);
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  255, 229, 9, 20)),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                      ),
                                      fixedSize: MaterialStateProperty.all(
                                          const Size(356, 10))),
                                  child: const Text(
                                    'GET STARTED',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    })))));
  }
}
