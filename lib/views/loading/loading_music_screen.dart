import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/appbars/appbar_without_percent_bar.dart';
import '../../controllers/music_controller.dart';
import '../music/play_music_screen.dart';

class LoadingMusicScreen extends StatefulWidget {
  const LoadingMusicScreen({super.key});

  @override
  State<LoadingMusicScreen> createState() => _LoadingMusicScreenState();
}

class _LoadingMusicScreenState extends State<LoadingMusicScreen> {
  final musicController = Get.find<MusicController>();

  Future<void> _changePage() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.to(() => PlayMusicScreen());
  }

  @override
  void initState() {
    super.initState();
    musicController.loadMusic();
    _changePage();
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
            child: Text(
              '정보를 불러오고 있습니다!\n잠시만 기다려주세요...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SolmoeFont',
                fontSize: 24,
                color: Color(0xFF2C3342),
              ),
            ),
          ),
          bottomNavigationBar: SizedBox(height: 33,),
        )
      ],
    );
  }
}
