import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/login_page_controller.dart';

class LoginButtons extends StatelessWidget {
  final controller = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            controller.kakaoLogin();
          },
          child: Image.asset(
            'assets/images/buttons/카카오로그인버튼.png',
            width: 283.2,
            height: 42.4,
          ),
        ),
        SizedBox(height: height * 0.023),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('전화번호로 로그인', style: _whiteRobotoStyle),
            SizedBox(width: width * 0.015),
            const Text('|', style: _whiteRobotoStyle),
            SizedBox(width: width * 0.015),
            const Text('전화번호로 가입', style: _whiteRobotoStyle),
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