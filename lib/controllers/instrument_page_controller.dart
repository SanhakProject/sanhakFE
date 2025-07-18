import 'package:get/get.dart';
import 'package:sanhak/views/check/check_decibel_screen.dart';

import '../views/home/music_screen.dart';

class InstrumentPageController extends GetxController {
  Rx<String> instrumentName = ''.obs;
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