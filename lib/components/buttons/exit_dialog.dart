import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/home/home_screen.dart';

void exitDialog() {
  Get.dialog(
    AlertDialog(
      backgroundColor: Colors.white,
      title: const Text(
          "나가기",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      content: const Text(
          "정말 홈 화면으로 나가시겠습니까?",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(), // 팝업 닫기
          child: const Text(
              "취소",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Get.offAll(() => HomeScreen()); // 홈으로 이동
          },
          child: const Text(
              "확인",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
    barrierDismissible: false, // 바깥 터치로 닫히지 않게
  );
}