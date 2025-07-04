import 'package:get/get.dart';

import '../views/home/home_screen.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  Future<void> kakaoLogin() async {
    isLoading.value = true;

    try {
      //TODO: 카카오 로그인 실행
      await Future.delayed(Duration(seconds: 1));

      Get.offAll(() => HomeScreen());
    } catch (e) {
      Get.snackbar("로그인 실패", "다시 시도해주세요");
    } finally {
      isLoading.value = false;
    }
  }
}