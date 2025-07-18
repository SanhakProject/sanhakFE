import 'package:flutter/material.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class AppBarWithPercentBar extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithPercentBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Text(
              "별달거리 - 북",
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