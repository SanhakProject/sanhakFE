import 'package:dio/dio.dart';
import '../auth/token_storage_service.dart';

Future<Map<String, dynamic>> getTracks(String instrument) async {
  final dio = Dio();
  final TokenStorageService tokenStorageService = TokenStorageService();
  final accessToken = await tokenStorageService.getAccessToken();

  final response = await dio.get(
    'https://api.arinori.app/api/tracks',
    queryParameters: {
      'instrument': instrument,
    },
    options: Options(
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    ),
  );

  return response.data;
}