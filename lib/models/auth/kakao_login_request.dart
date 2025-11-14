class KakaoLoginRequest {
  final String kakaoAccessToken;

  KakaoLoginRequest({
    required this.kakaoAccessToken,
  });

  Map<String, dynamic> toJson() {
    return {
      'kakaoAccessToken': kakaoAccessToken,
    };
  }
}
