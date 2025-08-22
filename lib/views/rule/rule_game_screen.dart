import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/appbars/appbar_with_percent_bar.dart';
import '../../components/icons/icon_with_name_first_line.dart';
import '../../components/icons/icon_with_name_next_line.dart';
import '../../controllers/game_screen_controller.dart';
import '../../controllers/music_controller.dart';
import 'rule_bottom_button.dart';
import 'rule_final_screen.dart';

class RuleGameScreen extends StatefulWidget {
  const RuleGameScreen({super.key});

  @override
  State<RuleGameScreen> createState() => _RuleGameScreenState();
}

class _RuleGameScreenState extends State<RuleGameScreen> {
  final List<bool> _isBig = List.generate(8, (_) => false);
  final controller = Get.find<GameScreenController>();
  final musicController = Get.find<MusicController>();

  Future<void> _startSequentialAnimation() async {
    for (int j = 0; j < controller.totalMeasure.value; j++) {
      for (int i = 0; i < _isBig.length; i++) {
        setState(() {
          _isBig[i] = true;
        });
        await Future.delayed(const Duration(milliseconds: 173));
        setState(() {
          _isBig[i] = false;
        });
      }
    }
    Future.delayed(const Duration(seconds: 5), () {
      Get.to(() => const RuleFinalScreen());  // TODO: 로딩 화면으로 변경 예정
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 1));
      musicController.playMusic();
      await Future.delayed(const Duration(seconds: 1));
      controller.updateMeasures();
      _startSequentialAnimation();
    });
  }

  @override
  void dispose() {
    super.dispose();
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
          body: Obx(() => Center(
              child: (controller.currentMeasure.length == 8)
                ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(8, (i) {
                      return controller.currentMeasure.length > i && controller.currentMeasure[i].isNotEmpty
                          ? Transform.scale(
                        scale: _isBig[i] ? 1.5 : 1.0,
                        child: IconWithNameFirstLine(
                          name: controller.currentMeasure[i],
                          instrument: "북",
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
                        controller.nextMeasure.length == 8
                            ? List.generate(8, (i) {
                          return controller.nextMeasure[i].isNotEmpty
                              ? IconWithNameNextLine(
                            name: controller.nextMeasure[i],
                            instrument: "북",
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
          bottomNavigationBar: RuleBottomButton(),
        )
      ],
    );
  }
}