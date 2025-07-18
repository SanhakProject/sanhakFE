import 'package:flutter/material.dart';
import 'package:sanhak/components/appbars/appbar_without_percent_bar.dart';

class CheckDecibelScreen extends StatelessWidget {
  const CheckDecibelScreen({super.key});

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
                Text(
                  '사용하시는 악기를 여러번 연주해주세요!',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
                SizedBox(height: 20,),
                Image.asset('assets/images/icons/스피커.png', width: 40,),
                // TODO: 80 데시벨 이상 시 페이지 넘어감
              ],
            ),
          ),
        )
      ],
    );
  }
}