import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import 'instrument_page_controller.dart';

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
    final instrumentController = Get.find<InstrumentPageController>();
    final songLevel = instrumentController.songLevel.value;
    if (songLevel == '쉬움') {
      try {
        await _player.setAsset('assets/music/easy.mp3');
        await _player.seek(Duration.zero);
      } catch (e) {
        throw Exception("_initPlayer Error: $e");
      }
    } else if (songLevel == '보통') {
      try {
        await _player.setAsset('assets/music/mid.mp3');
        await _player.seek(Duration.zero);
      } catch (e) {
        throw Exception("_initPlayer Error: $e");
      }
    } else if (songLevel == '어려움') {
      try {
        await _player.setAsset('assets/music/hard.mp3');
        await _player.seek(Duration.zero);
      } catch (e) {
        throw Exception("_initPlayer Error: $e");
      }
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