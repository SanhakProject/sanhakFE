import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/appbars/appbar_without_percent_bar.dart';
import '../../controllers/game_screen_controller.dart';
import '../../controllers/instrument_page_controller.dart';
import '../game/game_screen.dart';
import '../rule/rule_game_screen.dart';

class LoadingPrepareScreen extends StatefulWidget {
  final String? gameMode; // 게임 모드 매개변수 (rule 화면 or gmae 화면 결정)
  
  const LoadingPrepareScreen({super.key, this.gameMode});
  @override
  State<LoadingPrepareScreen> createState() => _LoadingPrepareScreenState();
}

class _LoadingPrepareScreenState extends State<LoadingPrepareScreen> {
  final controller = Get.find<GameScreenController>();
  final instrumentController = Get.find<InstrumentPageController>();

  Future<void> _prepareInformation() async {
    await controller.fetchMeasures();
    await Future.delayed(const Duration(seconds: 3));
    // gameMode에 따라 분기
    // 이후 gamefinal 등 다른 화면으로 전환을 위한 수정 필요
    if (widget.gameMode == '게임을 시작하기 전, 음향테스트를 진행합니다.\n사용하시는 악기를 여러번 연주해주세요!') {
      Get.to(() => RuleGameScreen());
    } else {
      Get.to(() => GameScreen());
    }  }

  @override
  void initState() {
    super.initState();
    _prepareInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
              'assets/images/background/배경화면2.png',
              fit: BoxFit.cover,
            ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBarWithoutPercentBar(),
          body: Center(
            child: Text(
              '정보를 불러오고 있습니다!\n잠시만 기다려주세요...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SolmoeFont',
                fontSize: 24,
                color: Color(0xFF2C3342),
              ),
            ),
          ),
        )
      ],
    );
  }
}
