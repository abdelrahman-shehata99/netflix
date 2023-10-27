import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/modules/tabF/controllers/tabf_controller.dart';
import 'package:netflix/modules/tabF/views/tabf_view.dart';
import 'package:netflix/modules/tabS/controllers/tabs_controller.dart';
import 'package:netflix/modules/tabS/views/tabs_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => TabFController());
    Get.lazyPut(() => TabSController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            physics: const BouncingScrollPhysics(),
            children: [
              const TabFView(),
              Tab3(),
              TabSView(),
              Tab4(),
              Tab5(),
            ],
          ),
          SizedBox(
            height: 80,
            child: AppBar(
              leading: const Image(
                image: AssetImage('assets/images/netIcon.png'),
              ),
              backgroundColor: const Color.fromARGB(0, 255, 193, 7),
              actions: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'TV Shows',
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  width: 15,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Movies',
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  width: 15,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'My List',
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  width: 25,
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.currentPage.value,
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            onTap: (page) {
              controller.goToTap(page);
            },
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 11,
            unselectedFontSize: 10,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_outline_outlined),
                label: 'Coming Soon',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.download),
                label: 'Downloads',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'More',
              ),
            ],
          )),
    );
  }
}

class Tab3 extends StatelessWidget {
  const Tab3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}

class Tab4 extends StatelessWidget {
  const Tab4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}

class Tab5 extends StatelessWidget {
  const Tab5({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
