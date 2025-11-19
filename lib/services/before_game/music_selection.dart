import 'package:dio/dio.dart';
import '../../models/track_sheet_grid.dart';

class MusicSelectionService {
  final Dio _dio = Dio();

  Future<TrackSheetGrid> getTrackSheet(int trackId, String instrument) async {
    try {
      final response = await _dio.get(
        '/tracks/$trackId/$instrument',
      );

      if (response.statusCode == 200) {
        return TrackSheetGrid.fromJson(response.data);
      } else {
        throw Exception('악보를 불러오는 데 실패했습니다.');
      }
    } on DioException catch (e) {
      throw Exception('네트워크 오류 발생: ${e.message}');
    }
  }
}
