import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class MusicController extends GetxController {
  final AudioPlayer _player = AudioPlayer();

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
}