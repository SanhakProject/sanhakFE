import 'package:dio/dio.dart';
import '../auth/token_storage_service.dart';

Future<Map<String, dynamic>> postResult(int trackId, String instrument, Map<String, dynamic> body) async {
  final dio = Dio();
  final tokenStorageService = TokenStorageService();
  final accessToken = await tokenStorageService.getAccessToken();

  final response = await dio.post(
    'https://api.arinori.app/api/tracks/$trackId/$instrument',
    data: body,
    options: Options(
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    ),
  );

  return response.data;
}