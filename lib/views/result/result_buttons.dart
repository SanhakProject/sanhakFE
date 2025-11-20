import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_screen.dart';
import '../wrong/wrong_page.dart';


class ResultButtons extends StatelessWidget {
  const ResultButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 288,
          height: 45,
          child: ElevatedButton(
            onPressed: () {
              Get.offAll(() => HomeScreen());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEDD154),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: const Text(
              '홈으로',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF2C3342),
              ),
            ),
          ),
        ),

        const SizedBox(width: 150),

        SizedBox(
          width: 288,
          height: 45,
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => WrongPage());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEDD154),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: const Text(
              '틀린 부분 복습하기',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFDB1912),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
