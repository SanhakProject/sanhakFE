import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/auth/token_storage_service.dart';
import 'home_button.dart';
import '../../controllers/login_page_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginPageController>();
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/images/background/배경화면1.png', fit: BoxFit.cover),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '아리노리',
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
              HomeButton(),
            ],
          ),
        ),
        // 로그아웃 버튼 (오른쪽 위)
        Positioned(
          top: 20,
          right: 20,
          child: TextButton(
            onPressed: () => controller.logout(),
            child: const Text(
              '로그아웃',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}