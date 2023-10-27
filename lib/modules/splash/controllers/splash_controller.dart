import 'dart:async';

import 'package:get/get.dart';
import 'package:netflix/routes/app_pages.dart';
import 'package:video_player/video_player.dart';

class SplashController extends GetxController {
  late VideoPlayerController videoP;
  late Future<void> initializeVideoPlayerFuture;

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    videoP.dispose();

    super.dispose();
  }

  @override
  void onInit() {
// Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    videoP = VideoPlayerController.asset('assets/images/videoplayback.webm');

    // Initialize the controller and store the Future for later use.
    initializeVideoPlayerFuture = videoP.initialize();

    // Use the controller to loop the video.
    videoP.setLooping(true);
    videoP.play();
    super.onInit();
  }

  loadApp() async {
    Future.delayed(const Duration(seconds: 4), () {
      Get.offAllNamed(
        Routes.START,
      );
      videoP.pause();
    });
  }

  @override
  void onClose() {}
}
