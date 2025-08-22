import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'instrument_screen.dart';
import '../record/record_screen.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 지난기록: RecordPage로 이동
        GestureDetector(
          onTap: () => Get.to(() => const RecordPage()),
          child: Image.asset(
            'assets/images/buttons/지난기록.png',
            width: 192,
          ),
        ),
        // 연주하기
        GestureDetector(
          onTap: () => Get.to(() => const InstrumentScreen()),
          child: Image.asset(
            'assets/images/buttons/연주하기.png',
            width: 240,
          ),
        ),
        // 게임방법 (추후 연결)
        Image.asset(
          'assets/images/buttons/게임방법.png',
          width: 192,
        ),
      ],
    );
  }
}
