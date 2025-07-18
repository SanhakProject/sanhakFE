import 'package:flutter/material.dart';

class LoadingPrepareScreen extends StatelessWidget {
  const LoadingPrepareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background/배경화면2.png',
            fit: BoxFit.cover,
          ),

          const Positioned(
            top: 15,
            left: 20,
            child: Text(
              '노래이름 - 북',
              style: TextStyle(
                fontFamily: 'SolmoeFont',
                fontSize: 20,
                color: Color(0xFFEDEAE6),
              ),
            ),
          ),

          const Center(
            child: Text(
              '정보를 불러오고 있습니다!\n잠시만 기다려주세요...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SolmoeFont',
                fontSize: 24,
                color: Color(0xFF2C3342),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
