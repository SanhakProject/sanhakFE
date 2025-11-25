import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sanhak/views/result/result_buttons.dart';
import 'package:sanhak/views/result/success_stat.dart';

import '../../controllers/instrument_page_controller.dart';
import '../../controllers/result_screen_controller.dart';
import 'consecutive_success_stat.dart';
import 'failure_stat.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ResultScreenController>();
    final formattedScore = NumberFormat('#,###').format(controller.score.value);
    final instrumentController = Get.find<InstrumentPageController>();
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background/배경화면1.png',
            fit: BoxFit.cover,
          ),

          Positioned(
            top: 96,
            left: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SuccessStat(),
                SizedBox(height: 8),
                FailureStat(),
                SizedBox(height: 8),
                ConsecutiveSuccessStat(),
              ],
            ),
          ),

          Positioned(
            top: 40,
            right: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  '새로운 최고 기록!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFFEDD154),
                  ),
                ),
                Text(
                  formattedScore,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '최고 점수: $formattedScore',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 14),
                const SizedBox(width: 8),
                Text(
                  '${instrumentController.songName}\n${instrumentController.songLevel}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: ResultButtons(),
            ),
          ),
        ],
      ),
    );
  }
}
