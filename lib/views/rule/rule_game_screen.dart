import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanhak/views/rule/rule_final_screen.dart';

import '../../components/appbars/appbar_with_percent_bar.dart';
import 'package:sanhak/views/rule/rule_bottom_button.dart';
import '../../components/icons/drums_with_name.dart';
import '../../controllers/game_screen_controller.dart';

class RuleGameScreen extends StatefulWidget {
  const RuleGameScreen({super.key});

  @override
  State<RuleGameScreen> createState() => _RuleGameScreenState();
}

class _RuleGameScreenState extends State<RuleGameScreen> {
  final List<bool> _isBig = List.generate(8, (_) => false);
  final controller = Get.find<GameScreenController>();

  Future<void> _startSequentialAnimation() async {
    for (int j = 0; j < controller.totalMeasure.value; j++) {
      for (int i = 0; i < _isBig.length; i++) {
        setState(() {
          _isBig[i] = true;
        });
        await Future.delayed(const Duration(milliseconds: 200));

        setState(() {
          _isBig[i] = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();

    ever(controller.currentMeasure, (value) {
      if (value.length != 8) {
        Future.delayed(const Duration(seconds: 5), () {
          Get.to(() => const RuleFinalScreen());
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 3));
      controller.updateMeasures();
      _startSequentialAnimation();
    });
  }

  @override
  void dispose() {
    controller.controllerDispose();
    // 만약 애니메이션을 추가할 경우 dispose 필요
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          body: Stack( // Column을 Stack으로 변경
            children: [
              Column(
                children: [
                  Expanded(
                    child: (controller.currentMeasure.value.length == 8)
                     ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(8, (i) {
                            return controller.currentMeasure.value.length > i && controller.currentMeasure.value[i].isNotEmpty
                                ? Transform.scale(
                              scale: _isBig[i] ? 1.5 : 1.0,
                              child: IconWithName(name: controller.currentMeasure.value[i],),
                            )
                                : const SizedBox(width: 100,);
                          }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: controller.nextMeasure.value.length == 8
                              ? List.generate(8, (i) {
                            return controller.nextMeasure.value[i].isNotEmpty
                                ? IconWithName(name: controller.nextMeasure.value[i])
                                : const SizedBox(width: 100);
                          })
                              : [const SizedBox(height: 100,)],
                        ),
                      ],
                    )
                        : Center(child: Text(
                        '연주를 완료하였습니다!',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )),
                  ),
                ],
              ),
              Positioned(
                bottom: 9,
                left: 70,
                child: RuleBottomButton(),
              ),
            ],
          ),
        )
      ],
    );
  }
}