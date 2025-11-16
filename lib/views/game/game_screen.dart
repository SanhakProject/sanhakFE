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
import '../result/result_screen.dart';

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

  Future<void> _startSequentialAnimation() async {
    for (int j = 0; j < controller.totalMeasure.value; j++) {
      for (int i = 0; i < _isBig.length; i++) {
        setState(() {_isBig[i] = true;});

        decibelController.beginWindow();

        await Future.delayed(Duration(milliseconds: controller.interval.value));

        final maxDb = decibelController.endWindow();
        if (controller.allMeasures[j][i].isEmpty) {
          if (maxDb < 75) {_correct += 1;} else {_wrong += 1;}
        } else {
          if (maxDb >= 75) {_correct += 1;} else {_wrong += 1;}
        }
        setState(() {_isBig[i] = false;});
      }
    }
    Future.delayed(const Duration(seconds: 5), () {
      print('correct: $_correct');
      print('wrong: $_wrong');
      Get.to(() => const ResultScreen());  // TODO: 로딩 화면으로 변경 예정
    });
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