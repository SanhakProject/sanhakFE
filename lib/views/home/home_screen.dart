import 'package:flutter/material.dart';

import 'home_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                '게임이름',
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
              HomeButton(),
            ],
          ),
        )
      ],
    );
  }
}