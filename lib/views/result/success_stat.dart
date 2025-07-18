import 'package:flutter/material.dart';

class SuccessStat extends StatelessWidget {
  const SuccessStat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      height: 62,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2C3342),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,   // 좌/우 분리
        crossAxisAlignment: CrossAxisAlignment.center,       // 세로 중앙 정렬
        children: [
          // 왼쪽에 “성공”
          const Text(
            '성공',
            style: TextStyle(
              fontFamily: 'SolmoeFont',
              fontSize: 24,
              color: Colors.white,
              shadows: [
                Shadow(color: Color(0xFFFEE500), blurRadius: 8),
              ],
            ),
          ),

          // 오른쪽에 숫자 + 퍼센트 (Baseline 정렬)
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '1234',
                style: TextStyle(
                  fontFamily: 'SolmoeFont',
                  fontSize: 32,
                  color: Colors.white,
                  shadows: [
                    const Shadow(color: Color(0xFFFEE500), blurRadius: 8),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              const Text(
                '(100%)',
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
    );
  }
}
