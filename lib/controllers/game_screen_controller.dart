import 'package:get/get.dart';

import '../helpers/filter_interlude.dart';
import '../helpers/filter_interval.dart';
import '../helpers/filter_line_change.dart';
import '../helpers/filter_measure.dart';
import '../helpers/filter_one_line_measure.dart';
import '../helpers/filter_total_measure.dart';
import '../services/instrument/easy_drum_service.dart';
import '../services/instrument/easy_ggueng_service.dart';
import '../services/instrument/easy_janggu_service.dart';
import '../services/instrument/easy_jing_service.dart';
import '../services/instrument/hard_drum_service.dart';
import '../services/instrument/hard_ggueng_service.dart';
import '../services/instrument/hard_janggu_service.dart';
import '../services/instrument/hard_jing_service.dart';
import '../services/instrument/mid_drum_service.dart';
import '../services/instrument/mid_ggueng_service.dart';
import '../services/instrument/mid_janggu_service.dart';
import '../services/instrument/mid_jing_service.dart';
import 'instrument_page_controller.dart';

class GameScreenController extends GetxController {
  Rx<int> totalMeasure = 0.obs;
  RxList<List<String>> allMeasures = <List<String>>[].obs;
  RxList<List<String>> copyAllMeasures = <List<String>>[].obs;
  RxList<String> currentMeasure = <String>[].obs;
  RxList<String> nextMeasure = <String>[].obs;
  Rx<int> interval = 0.obs;
  Rx<int> lineChange = 0.obs;
  Rx<int> interlude = 0.obs;
  Rx<int> oneLineMeasure = 0.obs;

  RxList<List<String>> totalPlayedNotes = <List<String>>[].obs;

  bool _isGameActive = false;

  Future<void> fetchMeasures() async {
    try {
      final instrumentController = Get.find<InstrumentPageController>();
      String instrumentName = instrumentController.instrumentName.value;
      String songLevel = instrumentController.songLevel.value;

      var rawData;

      if (instrumentName == '북' && songLevel == '쉬움') {
        rawData = await easyDrumService();
      } else if (instrumentName == '장구' && songLevel == '쉬움') {
        rawData = await easyJangguService();
      } else if (instrumentName == '징' && songLevel == '쉬움') {
        rawData = await easyJingService();
      } else if (instrumentName == '꽹과리' && songLevel == '쉬움') {
        rawData = await easyGguengService();
      } else if (instrumentName == '북' && songLevel == '어려움') {
        rawData = await hardDrumService();
      } else if (instrumentName == '장구' && songLevel == '어려움') {
        rawData = await hardJangguService();
      } else if (instrumentName == '징' && songLevel == '어려움') {
        rawData = await hardJingService();
      } else if (instrumentName == '꽹과리' && songLevel == '어려움') {
        rawData = await hardGguengService();
      } else if (instrumentName == '북' && songLevel == '보통') {
        rawData = await midDrumService();
      } else if (instrumentName == '장구' && songLevel == '보통') {
        rawData = await midJangguService();
      } else if (instrumentName == '징' && songLevel == '보통') {
        rawData = await midJingService();
      } else if (instrumentName == '꽹과리' && songLevel == '보통') {
        rawData = await midGguengService();
      }

      totalMeasure.value = await filterTotalMeasure(rawData);
      allMeasures.value = await filterMeasure(rawData);
      copyAllMeasures.value = await filterMeasure(rawData);
      interval.value = await filterInterval(rawData);
      lineChange.value = await filterLineChange(rawData);
      interlude.value = await filterInterlude(rawData);
      oneLineMeasure.value = await filterOneLineMeasure(rawData);
      currentMeasure.value = allMeasures[0];
      nextMeasure.value = allMeasures[1];
    } catch (e) {
      throw Exception("fetchMeasure Error: $e");
    }
  }

  Future<void> updateMeasures() async {
    _isGameActive = true; // 게임 시작 플래그 ON

    for (int i = 0; i < totalMeasure.value; i++) {
      // 1. 루프 시작 시 체크: 게임이 멈췄으면 즉시 종료
      if (!_isGameActive) return;

      currentMeasure.value = allMeasures[i];
      if (i == totalMeasure.value - 1) {
        nextMeasure.value = [""];
      } else {
        nextMeasure.value = allMeasures[i+1];
      }

      // 대기 시간
      await Future.delayed(Duration(milliseconds: lineChange.value));

      // 2. 대기 후 체크 (가장 중요): 기다리는 동안 게임이 꺼졌으면 즉시 종료
      if (!_isGameActive) return;
    }

    // 게임이 정상적으로 다 끝났을 때만 실행
    await Future.delayed(const Duration(seconds: 1));
    if (_isGameActive) {
      currentMeasure.value = [''];
    }
  }

  // [추가 2] 게임 강제 종료 및 리셋 함수
  void resetGame() {
    print("GameScreenController: 게임 강제 종료 및 리셋");
    _isGameActive = false; // 플래그를 꺼서 updateMeasures 루프를 멈춤

    // 필요하다면 데이터 초기화 (재진입 시 찌꺼기 데이터 방지)
    currentMeasure.clear();
    nextMeasure.clear();
    totalPlayedNotes.clear();
  }

  @override
  void onClose() {
    resetGame(); // 컨트롤러가 사라질 때 확실하게 멈춤
    super.onClose();
  }
}