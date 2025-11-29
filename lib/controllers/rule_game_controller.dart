import 'package:get/get.dart';

import '../helpers/filter_interlude.dart';
import '../helpers/filter_interval.dart';
import '../helpers/filter_line_change.dart';
import '../helpers/filter_measure.dart';
import '../helpers/filter_one_line_measure.dart';
import '../helpers/filter_total_measure.dart';
import '../services/instrument/easy_jing_service.dart';

/// 튜토리얼용 게임 컨트롤러 (꼬마야꼬마야 징 쉬움 전용)
class RuleGameController extends GetxController {
  Rx<int> totalMeasure = 0.obs;
  RxList<List<String>> allMeasures = <List<String>>[].obs;
  RxList<String> currentMeasure = <String>[].obs;
  RxList<String> nextMeasure = <String>[].obs;
  Rx<int> interval = 0.obs;
  Rx<int> lineChange = 0.obs;
  Rx<int> interlude = 0.obs;
  Rx<int> oneLineMeasure = 0.obs;

  /// 징 쉬움 데이터 불러오기
  Future<void> fetchMeasures() async {
    try {
      final rawData = await easyJingService();

      totalMeasure.value = await filterTotalMeasure(rawData);
      allMeasures.value = await filterMeasure(rawData);
      interval.value = await filterInterval(rawData);
      lineChange.value = await filterLineChange(rawData);
      interlude.value = await filterInterlude(rawData);
      oneLineMeasure.value = await filterOneLineMeasure(rawData);
      currentMeasure.value = allMeasures[0];
      nextMeasure.value = allMeasures.length > 1 ? allMeasures[1] : [''];
    } catch (e) {
      throw Exception("RuleGameController fetchMeasure Error: $e");
    }
  }

  /// 악보 업데이트 (한 줄씩)
  Future<void> updateMeasures() async {
    for (int i = 0; i < totalMeasure.value; i++) {
      currentMeasure.value = allMeasures[i];
      if (i == totalMeasure.value - 1) {
        nextMeasure.value = [""];
      } else {
        nextMeasure.value = allMeasures[i + 1];
      }
      await Future.delayed(Duration(milliseconds: lineChange.value));
    }
    await Future.delayed(const Duration(seconds: 1));
    currentMeasure.value = [''];
  }

  /// 컨트롤러 상태 초기화
  void reset() {
    totalMeasure.value = 0;
    allMeasures.clear();
    currentMeasure.clear();
    nextMeasure.clear();
    interval.value = 0;
    lineChange.value = 0;
    interlude.value = 0;
    oneLineMeasure.value = 0;
  }
}
