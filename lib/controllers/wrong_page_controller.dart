import 'package:get/get.dart';

import 'game_screen_controller.dart';

class WrongPageController extends GetxController {
  RxList<List<String>> playedNotes = <List<String>>[].obs;
  RxList<List<String>> actualNotes = <List<String>>[].obs;
  RxList<List<String>> displayedNotes = <List<String>>[].obs;
  RxInt displayedNumber = 0.obs;

  Future<void> fetchTotalNotes() async {
    final controller = Get.find<GameScreenController>();
    actualNotes.value = controller.copyAllMeasures;
    playedNotes.value = controller.totalPlayedNotes;
  }

  Future<void> nextPage() async {
    displayedNumber.value += 3;
  }

  Future<void> previousPage() async {
    displayedNumber.value -= 3;
  }
}