import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLoginService {
  // 카카오 로그인 및 ID 토큰 발급
  Future<String?> loginAndGetIdToken() async {
    try {
      // 카카오톡 설치 여부 확인
      final installed = await isKakaoTalkInstalled();

      OAuthToken token;
      if (installed) {
        try {
          // 카카오톡으로 로그인
          token = await UserApi.instance.loginWithKakaoTalk();
        } catch (e) {
          // 카카오톡 로그인 실패 시 카카오 계정으로 로그인
          token = await UserApi.instance.loginWithKakaoAccount();
        }
      } else {
        // 카카오 계정으로 로그인
        token = await UserApi.instance.loginWithKakaoAccount();
      }

      // ID 토큰 반환 (accessToken이 아닌 idToken)
      return token.idToken;
    } catch (e) {
      throw Exception('카카오 로그인 실패: $e');
    }
  }

  // 현재 로그인된 사용자 정보 조회
  Future<User?> getUserInfo() async {
    try {
      User user = await UserApi.instance.me();
      return user;
    } catch (e) {
      throw Exception('사용자 정보 조회 실패: $e');
    }
  }

  // 로그아웃
  Future<void> logout() async {
    try {
      await UserApi.instance.logout();
    } catch (e) {
      throw Exception('로그아웃 실패: $e');
    }
  }

  // 연결 끊기 (회원 탈퇴)
  Future<void> unlink() async {
    try {
      await UserApi.instance.unlink();
    } catch (e) {
      throw Exception('연결 끊기 실패: $e');
    }
  }
}
