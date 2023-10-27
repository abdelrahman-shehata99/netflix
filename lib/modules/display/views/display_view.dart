import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controllers/display_controller.dart';

class DisplayView extends GetView<DisplayController> {
  const DisplayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          Navigator.of(context).pop();
          controller.videoP.pause();
        }),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'NETFLIX',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            Container(
              height: 400,
              child: AspectRatio(
                aspectRatio: controller.videoP.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    VideoPlayer(controller.videoP),
                    VideoProgressIndicator(controller.videoP,
                        allowScrubbing: true),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.red,
        backgroundColor: Colors.black,
        shape: const BeveledRectangleBorder(
            side: BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            )),
        onPressed: () {
          controller.videoP.value.isPlaying
              ? controller.videoP.pause()
              : controller.videoP.play();
        },
        child: Icon(
          controller.videoP.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
