import 'package:get/get.dart';

import '../helpers/filter_measure.dart';
import '../helpers/filter_total_measure.dart';
import '../services/dummy_data_service.dart';

class GameScreenController extends GetxController {
  Rx<int> totalMeasure = 0.obs;
  RxList<List<String>> allMeasures = <List<String>>[].obs;
  RxList<String> currentMeasure = <String>[].obs;
  RxList<String> nextMeasure = <String>[].obs;


  Future<void> fetchMeasures() async {
    try {
      final rawData = await dummyDataService();
      totalMeasure.value = await filterTotalMeasure(rawData);
      allMeasures.value = await filterMeasure(rawData);
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
      await Future.delayed(const Duration(milliseconds: 1400));
    }
    await Future.delayed(const Duration(seconds: 1));
    currentMeasure.value = [''];
  }
}