import 'package:get/get.dart';

import '../services/tracks/get_tracks.dart';
import '../services/tracks/post_result.dart';
import 'instrument_page_controller.dart';

class ResultScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt correctNotes = 0.obs;
  RxInt wrongNotes = 0.obs;
  RxInt combo = 0.obs;

  RxInt score = 0.obs;

  Future<void> fetchResultData() async {
    isLoading.value = true;

    final total = correctNotes.value + wrongNotes.value;

    final accuracy = total == 0 ? 0.0 : double.parse(
        (correctNotes.value / total).toStringAsFixed(3)
    );

    final baseScore = (accuracy * 900000).toInt();
    final comboScore = total == 0 ? 0 : (100000 * (combo.value / total)).toInt();

    score.value = baseScore + comboScore;

    await fetchResult();

    isLoading.value = false;
  }

  Future<void> fetchResult() async {
    final instrumentController = Get.find<InstrumentPageController>();
    final instrument = instrumentController.instrumentName.value;
    final songName = instrumentController.songName.value;
    print(songName);
    String instrumentEnglish = '';
    if (instrument == '북') {
      instrumentEnglish = 'BUK';
    } else if (instrument == '징') {
      instrumentEnglish = 'JING';
    } else if ('instrument' == '장구') {
      instrumentEnglish = 'JANGGU';
    } else {
      instrumentEnglish = 'KKWAENGGWARI';
    }
    final rawData = await getTracks(instrumentEnglish);
    print(rawData);

    final tracks = rawData['data']?['tracks'];

    final filteredData = tracks.firstWhere(
          (track) => track['title'] == songName,
      orElse: () => null,
    );

    print("filteredData: $filteredData");

    final trackId = filteredData?['trackId'];
    print("trackId: $trackId");

    final body = {
      'total': correctNotes.value + wrongNotes.value,
      'success': correctNotes.value,
      'fail': wrongNotes.value,
      'maxCombo': combo.value,
      'firstFailedMeasureIdx': 1,
      'firstFailedSlotIdx': 1
    };
    final postedData = await postResult(trackId, instrumentEnglish, body);
    print(postedData);
  }
}