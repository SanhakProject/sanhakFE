import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/appbars/appbar_with_percent_bar.dart';
import '../../controllers/music_controller.dart';
import '../home/home_screen.dart';

class PlayMusicScreen extends StatefulWidget {
  const PlayMusicScreen({super.key});

  @override
  State<PlayMusicScreen> createState() => _PlayMusicScreenState();
}

class _PlayMusicScreenState extends State<PlayMusicScreen> {
  final musicController = Get.find<MusicController>();

  @override
  void initState() {
    super.initState();

    musicController.playMusic();

    ever(musicController.isFinished, (finished) {
      if (finished == true) {
        Get.offAll(() => const HomeScreen());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    musicController.stopMusic();
  }

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
          body: const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Text(
                '음악 재생중...',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          )
        )
      ],
    );
  }
}