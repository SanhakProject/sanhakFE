import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/appbars/appbar_with_percent_bar.dart';
import '../../components/buttons/bottom_buttons.dart';
import '../../components/icons/icon_with_name_first_line.dart';
import '../../components/icons/icon_with_name_next_line.dart';
import '../../controllers/check_decibel_page.controller.dart';
import '../../controllers/game_screen_controller.dart';
import '../../controllers/instrument_page_controller.dart';
import '../../controllers/music_controller.dart';
import '../../controllers/result_screen_controller.dart';
import '../loading/loading_result_wait_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<bool> _isBig;
  final controller = Get.find<GameScreenController>();
  final instrumentController = Get.find<InstrumentPageController>();
  final musicController = Get.find<MusicController>();
  final decibelController = Get.find<CheckDecibelPageController>();

  int _correct = 0;
  int _wrong = 0;
  int _combo = 0;
  final List<int> _comboList = [];

  Future<void> _startSequentialAnimation() async {
    for (int j = 0; j < controller.totalMeasure.value; j++) {
      // 1. 큰 루프 시작 시 화면 살아있는지 체크
      if (!mounted) return;

      final List<String> playedNotes = [];
      for (int i = 0; i < _isBig.length; i++) {
        // 2. 내부 루프 시작 시 체크
        if (!mounted) return;

        setState(() { _isBig[i] = true; });
        decibelController.beginWindow();

        // === 여기가 제일 중요 ===
        // 지정된 시간만큼 대기 (이 시간 동안 사용자가 나갈 수 있음)
        await Future.delayed(Duration(milliseconds: controller.interval.value));

        // 3. 기다리고 눈을 떴는데 화면이 없으면 즉시 종료 (setState 방지)
        if (!mounted) return;
        // =======================

        final maxDb = decibelController.endWindow();

        // 점수 계산 로직
        if (controller.allMeasures[j][i].isEmpty) {
          if (maxDb < 75) {
            _correct += 1; _combo += 1;
            playedNotes.add('correct');
          } else {
            _wrong += 1; _comboList.add(_combo); _combo = 0;
            playedNotes.add('wrong');
          }
        } else {
          if (maxDb >= 75) {
            _correct += 1; _combo += 1;
            playedNotes.add('correct');
          } else {
            _wrong += 1; _comboList.add(_combo); _combo = 0;
            playedNotes.add('wrong');
          }
        }

        // 4. 안전하게 setState 호출
        if (mounted) {
          setState(() { _isBig[i] = false; });
        }
      }
      controller.totalPlayedNotes.add(playedNotes);
    }

    // 5. 모든 연주가 끝난 후 5초 대기 로직
    if (!mounted) return; // 대기 시작 전 체크

    await Future.delayed(const Duration(seconds: 5)); // await로 변경하여 흐름 제어

    if (!mounted) return; // 5초 대기 후 화면이 여전히 살아있는지 체크

    // 화면이 살아있을 때만 결과창 이동 로직 실행
    final resultController = Get.find<ResultScreenController>();
    resultController.correctNotes.value = _correct;
    resultController.wrongNotes.value = _wrong;
    final comboMax = _comboList.isNotEmpty ? _comboList.reduce(max) : 0;
    resultController.combo.value = comboMax;

    Get.to(() => const LoadingResultWaitScreen());
  }

  @override
  void initState() {
    super.initState();

    _isBig = List.generate(controller.oneLineMeasure.value, (_) => false);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 1));
      musicController.playMusic();
      await Future.delayed(Duration(milliseconds: controller.interlude.value));
      controller.updateMeasures();
      _startSequentialAnimation();
    });
  }

  @override
  void dispose() {
    super.dispose();
    decibelController.noiseCheckCancel();
    musicController.stopMusic();
    controller.onClose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
              'assets/images/background/배경화면2.png',
              fit: BoxFit.cover
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBarWithPercentBar(),
          body: Column(
            children: [
              Obx(() => Expanded(
                child: (controller.currentMeasure.length == controller.oneLineMeasure.value)
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(controller.oneLineMeasure.value, (i) {
                          return controller.currentMeasure.length > i && controller.currentMeasure[i].isNotEmpty
                              ? Transform.scale(
                            scale: _isBig[i] ? 1.5 : 1.0,
                            child: IconWithNameFirstLine(
                              name: controller.currentMeasure[i],
                              instrument: instrumentController.instrumentName.value,
                            ),
                          )
                              : const SizedBox(width: 100,);
                        }),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: width * 0.3333),
                        ...(
                            controller.nextMeasure.length == controller.oneLineMeasure.value
                                ? List.generate(controller.oneLineMeasure.value, (i) {
                              return controller.nextMeasure[i].isNotEmpty
                                  ? IconWithNameNextLine(
                                name: controller.nextMeasure[i],
                                instrument: instrumentController.instrumentName.value,
                              )
                                  : const SizedBox(width: 75);
                            })
                                : [const SizedBox(height: 100)]
                        ),
                      ],
                    )
                  ],
                )
                    : Center(child: Text(
                  '연주를 완료하였습니다!',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                )),
              )),
              BottomButtons(),
            ],
          ),
        )
      ],
    );
  }
}