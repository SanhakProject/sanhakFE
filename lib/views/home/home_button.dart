import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'instrument_screen.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/buttons/지난기록.png',
          width: 192,
        ),
        GestureDetector(
          child: Image.asset(
            'assets/images/buttons/연주하기.png',
            width: 240,
          ),
          onTap: () {
            Get.to(() => InstrumentScreen());
          },
        ),
        Image.asset(
          'assets/images/buttons/게임방법.png',
          width: 192,
        ),
      ],
    );
  }
}
