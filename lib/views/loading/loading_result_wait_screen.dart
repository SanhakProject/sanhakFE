import 'package:flutter/material.dart';

class LoadingResultWaitScreen extends StatelessWidget {
  const LoadingResultWaitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background/배경화면1.png',
            fit: BoxFit.cover,
          ),

          const Center(
            child: Text(
              '정보를 불러오고 있습니다!\n잠시만 기다려주세요...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SolmoeFont',
                fontSize: 24,
                color: Color(0xFFEDEAE6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
