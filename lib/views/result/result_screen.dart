import 'package:flutter/material.dart';
import 'package:sanhak/views/result/success_stat.dart';
import 'package:sanhak/views/result/failure_stat.dart';
import 'package:sanhak/views/result/consecutive_success_stat.dart';
import 'package:sanhak/views/result/result_buttons.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

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

          // 좌측 상단: 세로로 3개 Stat
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

          // 우측 상단 점수 영역
          Positioned(
            top: 40,
            right: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  '새로운 최고 기록!',
                  style: TextStyle(
                    fontFamily: 'SolmoeFont',
                    fontSize: 24,
                    color: Color(0xFFEDD154),
                  ),
                ),
                const Text(
                  '12,345,678',
                  style: TextStyle(
                    fontFamily: 'SolmoeFont',
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  '최고 점수: 12,345,678',
                  style: TextStyle(
                    fontFamily: 'SolmoeFont',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        'assets/images/background/곡아이콘.png',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '별달거리\n어려움',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'SolmoeFont',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 하단 버튼 두 개
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
