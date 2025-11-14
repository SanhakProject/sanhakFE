import 'package:get/get.dart';

import '../views/home/home_screen.dart';
import '../views/phone_login/phone_login_screen.dart';
import '../services/auth/auth_service.dart';
import '../services/auth/token_storage_service.dart';

class LoginPageController extends GetxController {
  final AuthService _authService = AuthService();
  final TokenStorageService _tokenStorage = TokenStorageService();
  Rx<bool> isLoading = false.obs;

  // 회원가입 입력 필드
  RxString name = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString password = ''.obs;
  RxString passwordConfirm = ''.obs;

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
    // 입력값 검증
    if (phoneNumber.value.isEmpty || password.value.isEmpty) {
      Get.snackbar("입력 오류", "전화번호와 비밀번호를 입력해주세요");
      return;
    }

    isLoading.value = true;
    try {
      final response = await _authService.login(
        phoneNumber: phoneNumber.value,
        password: password.value,
      );

      if (response.status == 200 && response.data != null) {
        // 토큰 저장
        final tokens = response.data!;
        await _tokenStorage.saveTokens(
          accessToken: tokens.accessToken,
          refreshToken: tokens.refreshToken,
        );

        Get.snackbar("로그인 성공", response.message);
        // 입력 필드 초기화
        phoneNumber.value = '';
        password.value = '';
        Get.offAll(() => HomeScreen());
      } else {
        Get.snackbar("로그인 실패", response.message);
      }
    } catch (e) {
      Get.snackbar("로그인 실패", "아이디 또는 비밀번호를 확인해주세요");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> phoneRegister() async {
    // 입력값 검증
    if (name.value.isEmpty || phoneNumber.value.isEmpty || password.value.isEmpty) {
      Get.snackbar("입력 오류", "모든 필드를 입력해주세요");
      return;
    }

    if (password.value != passwordConfirm.value) {
      Get.snackbar("입력 오류", "비밀번호가 일치하지 않습니다");
      return;
    }

    isLoading.value = true;
    try {
      final response = await _authService.signup(
        phoneNumber: phoneNumber.value,
        password: password.value,
        name: name.value,
      );

      if (response.status == 200) {
        Get.snackbar("회원가입 성공", response.message);
        // 입력 필드 초기화
        name.value = '';
        phoneNumber.value = '';
        password.value = '';
        passwordConfirm.value = '';
        Get.offAll(() => PhoneLoginScreen());
      } else {
        Get.snackbar("회원가입 실패", response.message);
      }
    } catch (e) {
      Get.snackbar("회원가입 실패", "다시 시도해주세요");
    } finally {
      isLoading.value = false;
    }
  }
}