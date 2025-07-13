import 'package:flutter/material.dart';
import 'package:sanhak/components/appbar.dart';

import 'instrument_button.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/images/background/배경화면.png', fit: BoxFit.cover),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: DefaultAppBar(),
          body: Column(
            children: [
              SizedBox(height: height * 0.06,),
              Text(
                '게임이름',
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
              SizedBox(height: 20,),
              InstrumentButton(),
            ],
          ),
        )
      ],
    );
  }
}
