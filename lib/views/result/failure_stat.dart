import 'package:flutter/material.dart';

class FailureStat extends StatelessWidget {
  const FailureStat({super.key});

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,  // 좌/우 분리
        crossAxisAlignment: CrossAxisAlignment.center,      // 세로 중앙 정렬
        children: [
          const Text(
            '실패',
            style: TextStyle(
              fontFamily: 'SolmoeFont',
              fontSize: 24,
              color: Color(0xFFD5D6D9),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,   // 베이스라인 정렬
            textBaseline: TextBaseline.alphabetic,
            children: const [
              Text(
                '1234',
                style: TextStyle(
                  fontFamily: 'SolmoeFont',
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 4),
              Text(
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
