import 'package:get/get.dart';
import 'package:sanhak/views/check/check_decibel_screen.dart';

class InstrumentPageController extends GetxController {
  Rx<String> instrumentName = ''.obs;
  Rx<String> songName = ''.obs;

  void getInstrumentName(String instrument) {
    instrumentName.value = instrument;
    Get.to(() => CheckDecibelScreen(), duration: Duration(milliseconds: 300));
  }
}