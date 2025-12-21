import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/appbars/appbar_without_percent_bar.dart';
import '../../controllers/game_screen_controller.dart';
import '../../controllers/music_controller.dart';
import '../../controllers/rule_game_controller.dart';
import '../../controllers/instrument_page_controller.dart';
import '../game/game_screen.dart';
import '../rule/rule_game_screen.dart';

class LoadingPrepareScreen extends StatefulWidget {
  final String? gameMode; // 게임 모드 매개변수 (rule 화면 or game 화면 결정)

  const LoadingPrepareScreen({super.key, this.gameMode});
  @override
  State<LoadingPrepareScreen> createState() => _LoadingPrepareScreenState();
}

class _LoadingPrepareScreenState extends State<LoadingPrepareScreen> {
  final gameController = Get.find<GameScreenController>();
  final ruleGameController = Get.find<RuleGameController>();
  final instrumentController = Get.find<InstrumentPageController>();
  final musicController = Get.find<MusicController>();

  Future<void> _prepareInformation() async {
    // gameMode에 따라 분기
    if (widget.gameMode == '게임을 시작하기 전, 음향테스트를 진행합니다.\n사용하시는 악기를 여러번 연주해주세요!') {
      // 튜토리얼: 징 쉬움 데이터 로드
      instrumentController.songLevel.value = '쉬움';
      await ruleGameController.fetchMeasures();
      await Future.delayed(const Duration(seconds: 3));
      Get.to(() => RuleGameScreen());
    } else {
      // 일반 게임: 선택한 악기/난이도 데이터 로드
      await gameController.fetchMeasures();
      await Future.delayed(const Duration(seconds: 3));
      Get.to(() => GameScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    _prepareInformation();
    musicController.loadMusic();
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
          bottomNavigationBar: SizedBox(height: 33,),
        )
      ],
    );
  }
}
