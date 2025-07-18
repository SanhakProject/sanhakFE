import 'package:flutter/material.dart';

import '../../components/appbars/appbar_with_percent_bar.dart';
import '../../components/buttons/bottom_buttons.dart';


class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
              'assets/images/background/배경화면2.png',
              fit: BoxFit.cover
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBarWithPercentBar(),
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: () {
                        // TODO: 결과 화면 연동
                      }, child: Text('결과 화면으로 넘어가기')),
                    ],
                  ),
                ),
              ),
              BottomButtons(),
            ],
          ),
        )
      ],
    );
  }
}