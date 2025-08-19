import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sanhak/views/rule/rule_bottom_button.dart';
import 'package:sanhak/views/rule/rule_check_decibel_screen.dart';


class RuleStep2Screen extends StatefulWidget {
  const RuleStep2Screen({super.key});

  @override
  State<RuleStep2Screen> createState() => _RuleStep2ScreenState();
}

class _RuleStep2ScreenState extends State<RuleStep2Screen> {
  @override
  void initState() {
    super.initState();
    
    // 2초 후 다음 화면으로 전환
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(() => RuleCheckDecibelScreen());
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
              '사용하시는 악기를\n화면에 나오는 악보에 맞춰서\n연주하시면 됩니다!',
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
    );  }
}