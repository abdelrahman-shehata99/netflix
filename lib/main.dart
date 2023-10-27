import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:netflix/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDp0aJCtkrWV-v6H9QHaq_xtbO_KRMijcA",
      appId: "1:508961487957:android:d10ec8fc7792b8cc7268dc",
      messagingSenderId: "508961487957",
      projectId: "netflix-a2378",
    ),
  );
  } catch (e) {
    print('this is error $e');
  }
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    print('${event.level.name} ${event.message}');
  });

  runApp(
    GetMaterialApp(
      title: "Netflix",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: (context, widget) {
        Function botToast = BotToastInit();
        Widget mWidget = botToast(context, widget);
        return MediaQuery(
          //Setting font does not change with system font size
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: mWidget,
        );
      },
      debugShowCheckedModeBanner: false,
      navigatorObservers: [BotToastNavigatorObserver()],
      themeMode: ThemeMode.light,
    ),
  );
}
