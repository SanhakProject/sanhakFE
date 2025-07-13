import 'package:get/get.dart';

import '../views/home/play_screen.dart';

class HomePageController extends GetxController {
  var isLoading = false.obs;

  Future<void> playGame() async {
    isLoading.value = true;
    try {
      Get.to(() => PlayScreen());
    } catch (e) {
      Get.snackbar('페이지 이동 실패', "다시 시도해주세요");
    } finally {
      isLoading.value = false;
    }
  }
}