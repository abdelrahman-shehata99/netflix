import 'package:get/get.dart';
import 'package:netflix/modules/display/bindings/display_bindings.dart';
import 'package:netflix/modules/display/views/display_view.dart';
import 'package:netflix/modules/home/bindings/home_binding.dart';
import 'package:netflix/modules/home/views/home_view.dart';
import 'package:netflix/modules/login/bindings/login_binding.dart';
import 'package:netflix/modules/login/views/login_view.dart';
import 'package:netflix/modules/splash/bindings/splash_binding.dart';
import 'package:netflix/modules/splash/views/splash_view.dart';
import 'package:netflix/modules/tabF/bindings/tabF_binding.dart';
import 'package:netflix/modules/tabF/views/tabF_view.dart';
import 'package:netflix/modules/tabS/bindings/tabS_binding.dart';
import 'package:netflix/modules/tabS/views/tabS_view.dart';

import '../modules/start/bindings/start_binding.dart';
import '../modules/start/views/start_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.START,
      page: () => StartView(),
      binding: StartBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TABS,
      page: () => TabSView(),
      binding: TabSBinding(),
    ),
    GetPage(
      name: _Paths.TABF,
      page: () => TabFView(),
      binding: TabFBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DISPLAY,
      page: () => DisplayView(),
      binding:DisplayBinding(),
    ),
  ];
}
