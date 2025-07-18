import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanhak/controllers/check_decibel_page.controller.dart';

import '../../components/appbars/appbar_without_percent_bar.dart';

class CheckDecibelScreen extends StatefulWidget {
  const CheckDecibelScreen({super.key});

  @override
  State<CheckDecibelScreen> createState() => _CheckDecibelScreenState();
}

class _CheckDecibelScreenState extends State<CheckDecibelScreen> {
  final controller = Get.find<CheckDecibelPageController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.checkDecibel();
      controller.changeText();
    });
  }

  @override
  void dispose() {
    controller.stopCheck();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/images/background/배경화면2.png', fit: BoxFit.cover),
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
        )
      ],
    );
  }
}