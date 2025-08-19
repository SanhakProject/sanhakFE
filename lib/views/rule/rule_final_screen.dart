import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sanhak/views/home/home_screen.dart';
import 'package:sanhak/views/rule/rule_bottom_button.dart';

class RuleFinalScreen extends StatefulWidget {
  const RuleFinalScreen({super.key});

  @override
  State<RuleFinalScreen> createState() => _RuleFinalScreenState();
}

class _RuleFinalScreenState extends State<RuleFinalScreen> {

  @override
  void initState() {
    super.initState();
    
    // 3초 후 다음 화면으로 전환
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => HomeScreen());
    });
  }

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
              '게임 방법',
              style: TextStyle(
                fontFamily: 'SolmoeFont',
                fontSize: 20,
                color: Color(0xFFEDEAE6),
              ),
            ),
          ),

          const Center(
            child: Text(
              '고생하셨습니다!\n이제 본격적인 사물놀이 연주를 시작해볼까요?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SolmoeFont',
                fontSize: 24,
                color: Color(0xFF2C3342),
              ),
            ),
          ),
          Positioned(
            bottom: 9,
            left: 70,
            child: RuleBottomButton(),
          ),        
          ],
      ),
    ); 
  }
}