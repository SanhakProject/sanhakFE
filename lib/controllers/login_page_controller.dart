import 'package:get/get.dart';

import '../views/home/home_screen.dart';
import '../views/phone_login/phone_login_screen.dart';

class LoginPageController extends GetxController {
  Rx<bool> isLoading = false.obs;

  Future<void> kakaoLogin() async {
    isLoading.value = true;
    try {
      //TODO: 카카오 로그인 실행
      Get.offAll(() => HomeScreen());
    } catch (e) {
      Get.snackbar("로그인 실패", "다시 시도해주세요");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> phoneLogin() async {
    isLoading.value = true;
    try {
      //TODO: 핸드폰 로그인 정보 전달
      Get.offAll(() => HomeScreen());
    } catch (e) {
      Get.snackbar("로그인 실패", "다시 시도해주세요");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> phoneRegister() async {
    isLoading.value = true;
    try {
      //TODO: 핸드폰 회원가입 정보 전달
      Get.offAll(() => PhoneLoginScreen());
    } catch (e) {
      Get.snackbar("로그인 실패", "다시 시도해주세요");
    } finally {
      isLoading.value = false;
    }
  }
}