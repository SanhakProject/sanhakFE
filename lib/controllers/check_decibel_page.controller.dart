import 'dart:async';

import 'package:get/get.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:sanhak/views/game/game_screen.dart';

// TODO: 5초가 지났는지 확인, 데시벨이 90 데시벨이 넘었는지 (여러 번 90이 넘어야지 확인)
class CheckDecibelPageController extends GetxController{
 Rx<int> overDecibel = 0.obs;
 Rx<String> displayedText = '사용하시는 악기를 여러번 연주해주세요!'.obs;
 late StreamSubscription<NoiseReading> _noiseCheck;

 void checkDecibel() {
   _noiseCheck = NoiseMeter().noise.listen(
         (NoiseReading noiseReading) {
       print('Noise: ${noiseReading.meanDecibel} dB');
       if (noiseReading.meanDecibel > 80) {
         overDecibel.value += 1;
         if (overDecibel.value >= 3) {
           stopCheck();
           Get.to(() => GameScreen());
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
   Future.delayed(Duration(seconds: 5), () {
     displayedText.value = '악기가 너무 멀거나 연주되지 않았습니다!\n위치 조정 후 다시 연주해주세요!';
   });
 }

 void stopCheck() {
   displayedText.value = '사용하시는 악기를 여러번 연주해주세요!';
   overDecibel.value = 0;
   _noiseCheck.cancel();
 }
}