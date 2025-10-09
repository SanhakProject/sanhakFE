import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/appbars/appbar_without_percent_bar.dart';
import '../../controllers/check_decibel_page.controller.dart';
import 'rule_bottom_button.dart';
class RuleCheckDecibelScreen extends StatefulWidget {
  const RuleCheckDecibelScreen({super.key});

  @override
  State<RuleCheckDecibelScreen> createState() => _RuleCheckDecibelScreenState();
}

class _RuleCheckDecibelScreenState extends State<RuleCheckDecibelScreen> {
  final controller = Get.find<CheckDecibelPageController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.checkDecibel();
      controller.changeText();
      controller.setInitialText(
        '게임을 시작하기 전, 음향테스트를 진행합니다.\n사용하시는 악기를 여러번 연주해주세요!',
      );
    });
  }

  @override
  void dispose() {
    controller.resetCheck();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
              'assets/images/background/배경화면2.png',
              fit: BoxFit.cover,
            ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBarWithoutPercentBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Text(
                  controller.displayedText.value,
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
                ),
                SizedBox(height: 20,),
                Image.asset('assets/images/icons/스피커.png', width: 40,),
              ],
            ),
          ),
          bottomNavigationBar: RuleBottomButton(),
        )
      ],
    );
  }
}