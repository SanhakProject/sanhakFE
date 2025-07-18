import 'package:flutter/material.dart';

/// font-family 기본 설정은 앱 초기에 선언해서 각 텍스트 마다 선언 불필요 (다른 앱 폰트 사용할 때만 선언)

class ConsecutiveSuccessStat extends StatelessWidget {
  const ConsecutiveSuccessStat({super.key});

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '연속적인 성공',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              shadows: [
                const Shadow(color: Color(0xFF14AE5C), blurRadius: 8),
              ],
            ),
          ),
          Text(
            '1234',
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              shadows: [
                const Shadow(color: Color(0xFF14AE5C), blurRadius: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
