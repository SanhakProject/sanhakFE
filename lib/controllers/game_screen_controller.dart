import 'package:get/get.dart';
import 'package:sanhak/services/easy_drum_service.dart';
import 'package:sanhak/services/easy_ggueng_service.dart';
import 'package:sanhak/services/easy_jing_service.dart';

import '../helpers/filter_interlude.dart';
import '../helpers/filter_interval.dart';
import '../helpers/filter_line_change.dart';
import '../helpers/filter_measure.dart';
import '../helpers/filter_total_measure.dart';
import '../services/easy_janggu_service.dart';
import 'instrument_page_controller.dart';

class GameScreenController extends GetxController {
  Rx<int> totalMeasure = 0.obs;
  RxList<List<String>> allMeasures = <List<String>>[].obs;
  RxList<String> currentMeasure = <String>[].obs;
  RxList<String> nextMeasure = <String>[].obs;
  Rx<int> interval = 0.obs;
  Rx<int> lineChange = 0.obs;
  Rx<int> interlude = 0.obs;

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
      }

      totalMeasure.value = await filterTotalMeasure(rawData);
      allMeasures.value = await filterMeasure(rawData);
      interval.value = await filterInterval(rawData);
      lineChange.value = await filterLineChange(rawData);
      interlude.value = await filterInterlude(rawData);
      currentMeasure.value = allMeasures[0];
      nextMeasure.value = allMeasures[1];
    } catch (e) {
      throw Exception("fetchMeasure Error: $e");
    }
  }

  Future<void> updateMeasures() async {
    for (int i = 0; i < totalMeasure.value; i++) {
      currentMeasure.value = allMeasures[i];
      if (i == totalMeasure.value - 1) {
        nextMeasure.value = [""];
      } else {
        nextMeasure.value = allMeasures[i+1];
      }
      await Future.delayed(Duration(milliseconds: lineChange.value));
    }
    await Future.delayed(const Duration(seconds: 1));
    currentMeasure.value = [''];
  }
}