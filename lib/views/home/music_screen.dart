import 'package:flutter/material.dart';

import '../../components/appbars/back_icon_appbar.dart';
import 'music_button.dart';


class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/images/background/배경화면1.png', fit: BoxFit.cover),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: BackIconAppBar(),
          body: Column(
            children: [
              SizedBox(height: height * 0.06,),
              SizedBox(height: 20,),
              MusicButton(),
            ],
          ),
        )
      ],
    );
  }
}
