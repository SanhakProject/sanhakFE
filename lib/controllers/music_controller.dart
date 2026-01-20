import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'instrument_page_controller.dart';

class MusicController extends GetxController {
  final AudioPlayer _player = AudioPlayer();

  // 진행률 바 표시를 위한 변수들
  final Rx<Duration> currentPosition = Duration.zero.obs;
  final Rx<Duration> totalDuration = Duration.zero.obs;

  // 음악 로딩 완료 여부 체크
  final RxBool isMusicLoaded = false.obs;

  final RxBool isFinished = false.obs;

  @override
  void onInit() {
    super.onInit();

    // 음악의 총 길이 감지
    _player.durationStream.listen((duration) {
      if (duration != null) {
        totalDuration.value = duration;
      }
    });

    // 현재 재생 중인 위치 실시간 감지
    _player.positionStream.listen((position) {
      currentPosition.value = position;
    });

    _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        isFinished.value = true;
      }
    });
  }

  /// [1] 음악 파일 로드 (재생은 하지 않고 준비만 함)
  Future<void> loadMusic() async {
    isMusicLoaded.value = false;

    final instrumentController = Get.find<InstrumentPageController>();
    final songLevel = instrumentController.songLevel.value;

    String assetPath;
    if (songLevel == '쉬움') {
      assetPath = 'assets/music/easy.mp3';
    } else if (songLevel == '보통') {
      assetPath = 'assets/music/mid.mp3';
    } else {
      assetPath = 'assets/music/hard.mp3'; // '어려움' 또는 예외 케이스
    }

    try {
      await _player.setAsset(assetPath);
      await _player.seek(Duration.zero); // 위치를 0초로 초기화
      isMusicLoaded.value = true;        // 로딩 완료 플래그 켜기
      print("음악 로드 성공: $assetPath");
    } catch (e) {
      isMusicLoaded.value = false;
      print("음악 로드 실패: $e");
    }
  }

  /// [2] 로드된 음악 재생 시작
  void playMusic() {
    if (isMusicLoaded.value) {
      _player.play();
    } else {
      print("음악이 아직 로드되지 않았습니다.");
    }
  }

  /// [3] 음악 완전 정지 (다시 play하면 처음부터 시작됨)
  void stopMusic() {
    _player.stop();
    _player.seek(Duration.zero); // 정지 시 위치를 맨 앞으로 돌려놓음
  }

  @override
  void onClose() {
    _player.dispose(); // 컨트롤러가 사라질 때 플레이어 리소스 해제
    super.onClose();
  }
}