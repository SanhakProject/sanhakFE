import 'package:get/get.dart';
import 'package:sanhak/views/check/check_decibel_screen.dart';

import '../views/home/music_screen.dart';

class InstrumentPageController extends GetxController {
  Rx<String> instrumentName = ''.obs;  // 게임 중 화면 개발 완료 시 북 제거
  Rx<String> songName = ''.obs;

  void getInstrumentName(String instrument) {
    instrumentName.value = instrument;
    Get.to(() => MusicScreen());
  }

  void getSongName(String name) {
    songName.value = name;
    Get.to(() => CheckDecibelScreen());
  }
}