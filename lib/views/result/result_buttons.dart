import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanhak/views/home/home_screen.dart';

/// Get navigator 를 사용할 꺼 같습니다! (메모리 관리 편리 등 여러 가지 이유) (Get.to, Get.back, Get.offall)

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
              // TODO: 복습 기능
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
