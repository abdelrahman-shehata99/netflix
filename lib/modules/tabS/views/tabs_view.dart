import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:native_video_view/native_video_view.dart';
import 'package:netflix/modules/tabS/controllers/tabs_controller.dart';

class TabSView extends GetView<TabSController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: NativeVideoView(
          keepAspectRatio: true,
          showMediaController: true,
          enableVolumeControl: true,
          onCreated: (controller) {
            controller.setVideoSource(
              'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
              sourceType: VideoSourceType.network,
              requestAudioFocus: true,
            );
          },
          onPrepared: (controller, info) {
            debugPrint('NativeVideoView: Video prepared');
            controller.play();
          },
          onError: (controller, what, extra, message) {
            debugPrint(
                'NativeVideoView: Player Error ($what | $extra | $message)');
          },
          onCompletion: (controller) {
            debugPrint('NativeVideoView: Video completed');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
