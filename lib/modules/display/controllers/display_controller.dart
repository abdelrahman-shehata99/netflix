import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class DisplayController extends GetxController {
  late VideoPlayerController videoP;
  late Future<void> initializeVideoPlayerFuture;

  @override
  void onInit() {
    final data = Get.arguments;
    videoP = VideoPlayerController.networkUrl(
      Uri.parse(data.toString()),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    print("--------- ${data.toString()}");
    videoP.addListener(() {});
    videoP.setLooping(true);
    videoP.initialize();
    videoP.play();
    super.onInit();
  }

  @override
  void onClose() {}

  @override
  void dispose() {
    videoP.dispose();
    super.dispose();
  }
}
