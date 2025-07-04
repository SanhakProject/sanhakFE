import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';

class LoginButtons extends StatelessWidget {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            controller.kakaoLogin();
          },
          child: Image.asset(
            'assets/images/카카오로그인버튼.png',
            width: 283.2,
            height: 42.4,
          ),
        ),
        const SizedBox(height: 9.2),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('전화번호로 로그인', style: _whiteRobotoStyle),
            SizedBox(width: 12.8),
            Text('|', style: _whiteRobotoStyle),
            SizedBox(width: 12.8),
            Text('전화번호로 가입', style: _whiteRobotoStyle),
          ],
        ),
      ],
    );
  }
}

const TextStyle _whiteRobotoStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Roboto',
  fontSize: 13,
);