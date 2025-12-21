import 'package:get/get.dart';
import '../services/me/get_play_results.dart';

class RecordScreenController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<Map<String, dynamic>> records = <Map<String, dynamic>>[].obs;

  Future<void> getResults() async {
    isLoading.value = true;
    try {
      final response = await getPlayResults();
      final rawData = response["data"]["playResults"] as List;

      records.value = rawData.map((item) {
        return {
          'title': item['trackTitle'].toString(),
          'level': _convertDifficulty(item['difficulty']),
          'accuracy': ((item['accuracy'] as double) * 100).round(),
          'playedAt': _formatDate(item['playedAt']),
        };
      }).toList();
    } catch (e) {
      print("getResultsError: $e");
    } finally {
      await Future.delayed(const Duration(seconds: 1));
      isLoading.value = false;
    }
  }

  String _convertDifficulty(String difficulty) {
    switch (difficulty) {
      case 'HARD':
        return '어려움';
      case 'NORMAL':
        return '보통';
      case 'EASY':
        return '쉬움';
      default:
        return '보통';
    }
  }

  String _formatDate(String isoDateString) {
    DateTime dt = DateTime.parse(isoDateString);
    String year = dt.year.toString();
    String month = dt.month.toString().padLeft(2, '0');
    String day = dt.day.toString().padLeft(2, '0');
    String hour = dt.hour.toString().padLeft(2, '0');
    String minute = dt.minute.toString().padLeft(2, '0');

    return '$year.$month.$day $hour:$minute';
  }
}