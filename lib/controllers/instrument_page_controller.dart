import 'package:get/get.dart';

import '../views/check/check_decibel_screen.dart';
import '../views/home/music_screen.dart';

class InstrumentPageController extends GetxController {
  Rx<String> instrumentName = ''.obs;
  Rx<String> songName = ''.obs;
  Rx<String> songLevel = ''.obs;

  void getInstrumentName(String instrument) {
    instrumentName.value = instrument;
    Get.to(() => MusicScreen());
  }

  void getSongInfo(String name, String level) {
    songName.value = name;
    songLevel.value = level;
    Get.to(() => CheckDecibelScreen());
  }

  void setPractice() {
    songName.value = '게임 방법';
  }
}