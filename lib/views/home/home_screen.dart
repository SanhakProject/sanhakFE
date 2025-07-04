import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '게임이름',
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                      'assets/images/지난기록.png',
                    width: 192,
                  ),
                  Image.asset(
                      'assets/images/연주하기.png',
                    width: 240,
                  ),
                  Image.asset(
                    'assets/images/게임방법.png',
                    width: 192,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}