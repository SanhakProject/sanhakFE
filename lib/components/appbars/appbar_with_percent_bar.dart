import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

import '../../controllers/instrument_page_controller.dart';
import '../../controllers/music_controller.dart';

class AppBarWithPercentBar extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithPercentBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<InstrumentPageController>();
    final musicController = Get.find<MusicController>();
    return AppBar(
      automaticallyImplyLeading: false,  // 뒤로 가기 버튼 제거
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Obx(() {
        final total = musicController.totalDuration.value.inMilliseconds;
        final current = musicController.currentPosition.value.inMilliseconds;
        final percent = (total == 0) ? 0.0 : current / total;

        return Row(
          children: [
            Text(
              controller.songName.value == '게임 방법'
                  ? controller.songName.value
                  : "${controller.songName.value} - ${controller.instrumentName.value}",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 100,),
            Expanded(
              child: LinearPercentIndicator(
                lineHeight: 10.0,
                percent: percent.clamp(0.0, 1.0),
                barRadius: Radius.circular(10),
                backgroundColor: Colors.white,
                progressColor: Color(0xFFEDD154),
                animation: false,
              ),
            ),
            Text(
              "${(percent * 100).clamp(0, 100).toStringAsFixed(0)}%",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            )
          ],
        );
      })
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}