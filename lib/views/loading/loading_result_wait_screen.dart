import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/result_screen_controller.dart';
import '../result/result_screen.dart';

class LoadingResultWaitScreen extends StatefulWidget {
  const LoadingResultWaitScreen({super.key});

  @override
  State<LoadingResultWaitScreen> createState() => _LoadingResultWaitScreenState();
}

class _LoadingResultWaitScreenState extends State<LoadingResultWaitScreen> {
  final controller = Get.find<ResultScreenController>();

  @override
  void initState() {
    super.initState();

    ever(controller.isLoading, (isLoading) async {
      if (isLoading == false) {
        await Future.delayed(const Duration(seconds: 1));
        Get.to(() => ResultScreen());
      }
    });

    controller.fetchResultData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background/배경화면1.png',
            fit: BoxFit.cover,
          ),

          const Center(
            child: Text(
              '정보를 불러오고 있습니다!\n잠시만 기다려주세요...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SolmoeFont',
                fontSize: 24,
                color: Color(0xFFEDEAE6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
