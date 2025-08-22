import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class MusicController extends GetxController {
  final AudioPlayer _player = AudioPlayer();

  final currentPosition = Duration.zero.obs;
  final totalDuration = Duration.zero.obs;

  @override
  void onInit() {
    super.onInit();

    _player.durationStream.listen((duration) {
      if (duration != null) {
        totalDuration.value = duration;
      }
    });

    _player.positionStream.listen((position) {
      currentPosition.value = position;
    });
  }

  Future<void> playMusic() async {
    try {
      await _player.setAsset('assets/dummy/dummy_music.mp3');
      await _player.seek(Duration.zero);
    } catch (e) {
      throw Exception("_initPlayer Error: $e");
    }
    _player.play();
  }

  void stopMusic() {
    _player.stop();
    _player.dispose();
  }

  @override
  void onClose() {
    _player.dispose();
    super.onClose();
  }
}