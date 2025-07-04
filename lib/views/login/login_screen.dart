import 'package:flutter/material.dart';

import 'login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/images/배경화면.png', fit: BoxFit.cover),
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
              const SizedBox(height: 17),
            ],
          ),
        )
      ],
    );
  }
}