import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/home/home_screen.dart';

void exitDialog() {
  Get.dialog(
    AlertDialog(
      title: const Text("나가기"),
      content: const Text("정말 홈 화면으로 나가시겠습니까?"),
      actions: [
        TextButton(
          onPressed: () => Get.back(), // 팝업 닫기
          child: const Text("취소"),
        ),
        TextButton(
          onPressed: () {
            Get.offAll(() => HomeScreen()); // 홈으로 이동
          },
          child: const Text("확인"),
        ),
      ],
    ),
    barrierDismissible: false, // 바깥 터치로 닫히지 않게
  );
}