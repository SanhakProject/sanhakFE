import 'package:flutter/material.dart';
import 'package:sanhak/components/appbars/appbar_with_percent_bar.dart';


class CheckTTSScreen extends StatelessWidget {
  const CheckTTSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
              'assets/images/background/배경화면2.png',
              fit: BoxFit.cover
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBarWithPercentBar(),
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        '어떤 행동을 하시겠습니까?',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '말로 말씀해주세요! 저희가 듣고있습니다!',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '예시: 다음 마디 시작, 모범 연주 듣기, 나가기',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 70,),
                  Image.asset(
                      'assets/images/buttons/나가기.png',
                    width: 88,
                  ),
                  Spacer(),
                  Image.asset(
                      'assets/images/buttons/모범연주듣기.png',
                    width: 150,
                  ),
                  SizedBox(width: 20,),
                  Image.asset(
                      'assets/images/buttons/내연주듣기.png',
                    width: 150,
                  ),
                  SizedBox(width: 40,),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}