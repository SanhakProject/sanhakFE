import 'dart:async';

import 'package:get/get.dart';
import 'package:noise_meter/noise_meter.dart';

import '../views/loading/loading_prepare_screen.dart';


class CheckDecibelPageController extends GetxController{
 Rx<int> overDecibel = 0.obs;
 Rx<String> displayedText = ''.obs;

 String _initialText = '';

 late StreamSubscription<NoiseReading> _noiseCheck;
 Timer? _changeTextTimer;

 // getter 추가
 String get initialText => _initialText;

   // 초기 텍스트만 설정
  void setInitialText(String text) {
    _initialText = text;
    displayedText.value = text;
  }

 void checkDecibel() {
   _noiseCheck = NoiseMeter().noise.listen(
         (NoiseReading noiseReading) {
       print('Noise: ${noiseReading.meanDecibel} dB');
       if (noiseReading.meanDecibel > 80) {
         overDecibel.value += 1;
         if (overDecibel.value >= 3) {
           stopCheck();
           Get.to(() => LoadingPrepareScreen(gameMode: _initialText));
         }
       }
     },
     onError: (Object error) {
       Get.snackbar('오류 발생!', "얘기치 못한 오류가 발생했습니다!");
     },
     cancelOnError: true,
   );
 }

 void changeText() {
   _changeTextTimer = Timer(Duration(seconds: 5), () {
     displayedText.value = "악기가 너무 멀거나 연주되지 않았습니다!\n위치 조정 후 다시 연주해주세요 !";
   });
 }

 void stopCheck() {
   displayedText.value = _initialText;
   overDecibel.value = 0;
   _changeTextTimer?.cancel();
   _noiseCheck.cancel();
 }
}