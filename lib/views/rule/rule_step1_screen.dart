import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sanhak/views/rule/rule_bottom_button.dart';
import 'package:sanhak/views/rule/rule_step2_screen.dart';


class RuleStep1Screen extends StatefulWidget {
  const RuleStep1Screen({super.key});

  @override
  State<RuleStep1Screen> createState() => _RuleStep1ScreenState();
}

class _RuleStep1ScreenState extends State<RuleStep1Screen> {
  
  @override
  void initState() {
    super.initState();
    
    // 2초 후 다음 화면으로 전환
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(() => RuleStep2Screen());
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
              '연주를 시작하기 전 사용하는 악기와\n 연주하고 싶은 음악을 고를 수 있습니다.',
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