import 'dart:async';

import 'package:get/get.dart';
import 'package:noise_meter/noise_meter.dart';

import '../views/loading/loading_prepare_screen.dart';


class CheckDecibelPageController extends GetxController{
 Rx<int> overDecibel = 0.obs;
 Rx<String> displayedText = ''.obs;

 String _initialText = '';

 // Windowing (per-slot max dB)
 bool _gate = false;
 double _currentMaxDb = double.negativeInfinity;

 // Noise stream (single reusable meter & nullable subscription)
 final NoiseMeter _meter = NoiseMeter();
 StreamSubscription<NoiseReading>? _noiseCheck;
 bool _isListening = false;

 Timer? _changeTextTimer;

 // getter 추가
 String get initialText => _initialText;

   // 초기 텍스트만 설정
  void setInitialText(String text) {
    _initialText = text;
    displayedText.value = text;
  }

  void checkDecibel() {
    if (_isListening) return; // prevent duplicate listen
    _isListening = true;

    _noiseCheck = _meter.noise.listen(
      (NoiseReading noiseReading) {
        // Always feed the windowing logic so game-side max dB works
        _onNoise(noiseReading);

        // Only the decibel check screens should trigger navigation
        final currentRoute = Get.currentRoute;
        if (currentRoute == "/CheckDecibelScreen" || currentRoute == "/RuleCheckDecibelScreen") {
          final db = noiseReading.meanDecibel;
          print(db);
          if (db > 80) {
            overDecibel.value += 1;
            if (overDecibel.value >= 3) {
              resetCheck();
              Get.to(() => LoadingPrepareScreen(gameMode: _initialText));
            }
          } else {
            // Reset streak when below threshold (for "consecutive 3 times" semantics)
            overDecibel.value = 0;
          }
        }
      },
      onError: (Object error) {
        Get.snackbar('오류 발생!', "예기치 못한 오류가 발생했습니다!");
        // Ensure resources are released on error
        noiseCheckCancel();
      },
      cancelOnError: true,
    );
  }

 void changeText() {
   _changeTextTimer = Timer(Duration(seconds: 5), () {
     displayedText.value = "악기가 너무 멀거나 연주되지 않았습니다!\n위치 조정 후 다시 연주해주세요 !";
   });
 }

 void _onNoise(NoiseReading r) {
   if (!_gate) return;
   final db = r.meanDecibel;
   if (db > _currentMaxDb) _currentMaxDb = db;
 }

 void beginWindow() {
   _currentMaxDb = double.negativeInfinity;
   _gate = true;
 }

 double endWindow() {
    _gate = false;
    return _currentMaxDb.isFinite ? _currentMaxDb : 0.0;
 }

 void resetCheck() {
   displayedText.value = _initialText;
   overDecibel.value = 0;
   _changeTextTimer?.cancel();
 }

  Future<void> noiseCheckCancel() async {
    try {
      await _noiseCheck?.cancel();
    } catch (_) {}
    _noiseCheck = null;
    _isListening = false;
  }

  @override
  void onClose() {
    // Ensure we release the stream if this controller is destroyed
    noiseCheckCancel();
    super.onClose();
  }
}