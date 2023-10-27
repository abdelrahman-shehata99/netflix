import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    controller.loadApp();
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Center(
            child: Container(
          color: Colors.black,
          height: double.infinity,
          child: FutureBuilder(
            future: controller.initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the VideoPlayerController has finished initialization, use
                // the data it provides to limit the aspect ratio of the video.
                return AspectRatio(
                  aspectRatio: controller.videoP.value.aspectRatio,
                  // Use the VideoPlayer widget to display the video.
                  child: VideoPlayer(controller.videoP),
                );
              } else {
                // If the VideoPlayerController is still initializing, show a
                // loading spinner.
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        )),
      ],
    ));
  }
}
