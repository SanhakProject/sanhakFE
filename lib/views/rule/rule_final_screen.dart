import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/appbars/appbar_without_percent_bar.dart';
import '../home/home_screen.dart';
import 'rule_bottom_button.dart';

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
    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
              'assets/images/background/배경화면2.png',
              fit: BoxFit.cover,
            )
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBarWithoutPercentBar(),
          body: Center(
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
          bottomNavigationBar: RuleBottomButton(),
        )
      ],
    );
  }
}