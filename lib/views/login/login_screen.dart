import 'package:flutter/material.dart';

import 'login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/images/background/배경화면1.png', fit: BoxFit.cover),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Spacer(flex: 3),
              const Center(
                child: Text(
                  '게임이름',
                  style: TextStyle(color: Colors.white, fontSize: 64),
                ),
              ),
              const Spacer(flex: 1),
              LoginButtons(),
              SizedBox(height: height * 0.043),
            ],
          ),
        )
      ],
    );
  }
}