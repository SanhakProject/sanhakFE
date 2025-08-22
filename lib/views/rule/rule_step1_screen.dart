import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/appbars/appbar_without_percent_bar.dart';
import '../../controllers/instrument_page_controller.dart';
import 'rule_bottom_button.dart';
import 'rule_step2_screen.dart';

class RuleStep1Screen extends StatefulWidget {
  const RuleStep1Screen({super.key});

  @override
  State<RuleStep1Screen> createState() => _RuleStep1ScreenState();
}

class _RuleStep1ScreenState extends State<RuleStep1Screen> {
  final controller = Get.find<InstrumentPageController>();
  
  @override
  void initState() {
    super.initState();
    controller.setPractice();
    
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
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBarWithoutPercentBar(),
            body: Center(
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
            bottomNavigationBar: RuleBottomButton(),
          )
        ],
      ),
    );  
  }
}