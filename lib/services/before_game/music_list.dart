import 'package:dio/dio.dart';
import '../../models/tracks_response.dart';

class MusicListService {
  final Dio _dio = Dio();

  Future<TracksResponse> getMusicList(String instrument) async {
    try {
      final response = await _dio.get('/tracks?instrument=$instrument');

      if (response.statusCode == 200) {
        return TracksResponse.fromJson(response.data);
      } else {
        throw Exception('음악 목록 로드 실패');
      }
    } on DioException catch (e) {
      throw Exception('네트워크 오류 발생: ${e.message}');
    }
  }
}
