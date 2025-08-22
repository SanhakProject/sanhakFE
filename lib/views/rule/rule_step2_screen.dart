import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/appbars/appbar_without_percent_bar.dart';
import 'rule_bottom_button.dart';
import 'rule_check_decibel_screen.dart';


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
              '사용하시는 악기를\n화면에 나오는 악보에 맞춰서\n연주하시면 됩니다!',
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