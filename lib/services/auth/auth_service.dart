import 'package:dio/dio.dart';

import '../../models/api_response.dart';
import '../../models/kakao_login_request.dart';
import '../../models/login_request.dart';
import '../../models/signup_request.dart';
import '../../models/token_response.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.arinori.app/api/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  Future<ApiResponse<String>> signup({
    required String phoneNumber,
    required String password,
    required String name,
  }) async {
    try {
      final request = SignupRequest(
        phoneNumber: phoneNumber,
        password: password,
        name: name,
      );

      final response = await _dio.post(
        '/auth/signup',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return ApiResponse<String>.fromJson(
          response.data,
          (data) => data as String,
        );
      } else {
        throw Exception('회원가입에 실패했습니다.');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('회원가입 실패: ${e.response?.data['message'] ?? e.message}');
      }
      throw Exception('네트워크 오류 발생: ${e.message}');
    }
  }

  Future<ApiResponse<TokenResponse>> login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final request = LoginRequest(
        phoneNumber: phoneNumber,
        password: password,
      );

      final response = await _dio.post(
        '/auth/login',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return ApiResponse<TokenResponse>.fromJson(
          response.data,
          (data) => TokenResponse.fromJson(data as Map<String, dynamic>),
        );
      } else {
        throw Exception('로그인에 실패했습니다.');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('로그인 실패: ${e.response?.data['message'] ?? e.message}');
      }
      throw Exception('네트워크 오류 발생: ${e.message}');
    }
  }

  Future<ApiResponse<TokenResponse>> kakaoLogin({
    required String kakaoAccessToken,
  }) async {
    try {
      final request = KakaoLoginRequest(
        kakaoAccessToken: kakaoAccessToken,
      );

      final response = await _dio.post(
        '/auth/oauth2/kakao',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return ApiResponse<TokenResponse>.fromJson(
          response.data,
          (data) => TokenResponse.fromJson(data as Map<String, dynamic>),
        );
      } else {
        throw Exception('카카오 로그인에 실패했습니다.');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('카카오 로그인 실패: ${e.response?.data['message'] ?? e.message}');
      }
      throw Exception('네트워크 오류 발생: ${e.message}');
    }
  }

  Future<ApiResponse<TokenResponse>> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.post(
        '/auth/refresh',
        data: {
          'refreshToken': refreshToken,
        },
      );

      if (response.statusCode == 200) {
        return ApiResponse<TokenResponse>.fromJson(
          response.data,
          (data) => TokenResponse.fromJson(data as Map<String, dynamic>),
        );
      } else {
        throw Exception('토큰 갱신에 실패했습니다.');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('토큰 갱신 실패: ${e.response?.data['message'] ?? e.message}');
      }
      throw Exception('네트워크 오류 발생: ${e.message}');
    }
  }
}