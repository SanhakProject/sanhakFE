import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

import '../../controllers/instrument_page_controller.dart';

class AppBarWithPercentBar extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithPercentBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<InstrumentPageController>();
    return AppBar(
      automaticallyImplyLeading: false,  // 뒤로 가기 버튼 제거
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Text(
              "${controller.songName.value} - ${controller.instrumentName.value}",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 100,),
          Expanded(
            child: LinearPercentIndicator(
              lineHeight: 10.0,
              percent: 0.32,  // 추후에 실제 퍼센트 적용 예정
              barRadius: Radius.circular(10),
              backgroundColor: Colors.white,
              progressColor: Color(0xFFEDD154),
              animation: true,
              animationDuration: 500,
            ),
          ),
          Text(
              "32%", // 추후에 실제 퍼센트 적용 예정
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}