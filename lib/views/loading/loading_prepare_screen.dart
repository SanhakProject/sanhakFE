import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanhak/controllers/instrument_page_controller.dart';

import '../../controllers/game_screen_controller.dart';
import '../game/game_screen.dart';

class LoadingPrepareScreen extends StatefulWidget {
  const LoadingPrepareScreen({super.key});

  @override
  State<LoadingPrepareScreen> createState() => _LoadingPrepareScreenState();
}

class _LoadingPrepareScreenState extends State<LoadingPrepareScreen> {
  final controller = Get.find<GameScreenController>();
  final instrumentController = Get.find<InstrumentPageController>();

  Future<void> _prepareInformation() async {
    await controller.fetchMeasures();
    await Future.delayed(const Duration(seconds: 3));
    Get.to(() => GameScreen());
  }

  @override
  void initState() {
    super.initState();
    _prepareInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background/배경화면2.png',
            fit: BoxFit.cover,
          ),

          Positioned(
            top: 15,
            left: 20,
            child: Text(
              '${instrumentController.songName.value} - ${instrumentController.instrumentName.value}',
              style: TextStyle(
                fontFamily: 'SolmoeFont',
                fontSize: 20,
                color: Color(0xFFEDEAE6),
              ),
            ),
          ),

          const Center(
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
        ],
      ),
    );
  }
}
