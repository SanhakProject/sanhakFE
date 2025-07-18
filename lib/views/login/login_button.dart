import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanhak/views/phone_login/phone_login_screen.dart';
import 'package:sanhak/views/phone_register/phone_register_screen.dart';

import '../../controllers/login_page_controller.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final controller = Get.find<LoginPageController>();
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
            TextButton(
              onPressed: () {
                 Get.to(() => PhoneLoginScreen());
              },
              child: const Text(
                '전화번호로 로그인',
                style: _whiteRobotoStyle,
              ),
            ),
            SizedBox(width: width * 0.015),
            const Text('|', style: _whiteRobotoStyle),
            SizedBox(width: width * 0.015),
            TextButton(
              onPressed: () {
                Get.to(() => PhoneRegisterScreen());
              },
              child: Text(
                '전화번호로 가입', 
                style: _whiteRobotoStyle),
                ),
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