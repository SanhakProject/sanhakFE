import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/game_screen_controller.dart';
import '../../provider.dart';
import '../game/game_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([  /// 화면 가로 고정
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);  // 기기 앱바 무시
  initControllers();
  runApp(const LoadingPrepareScreenApp());
}

class LoadingPrepareScreenApp extends StatelessWidget {
  const LoadingPrepareScreenApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'SolmoeFont'),
        home: LoadingPrepareScreen()
    );
  }
}

class LoadingPrepareScreen extends StatefulWidget {
  const LoadingPrepareScreen({super.key});

  @override
  State<LoadingPrepareScreen> createState() => _LoadingPrepareScreenState();
}

class _LoadingPrepareScreenState extends State<LoadingPrepareScreen> {
  final controller = Get.find<GameScreenController>();

  Future<void> _prepareInformation() async {
    await controller.fetchMeasures();
    await Future.delayed(const Duration(seconds: 3));
    Get.to(() => GameScreen());
  }

  @override
  void initState() {
    super.initState();
    _prepareInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background/배경화면2.png',
            fit: BoxFit.cover,
          ),

          const Positioned(
            top: 15,
            left: 20,
            child: Text(
              '노래이름 - 북',
              style: TextStyle(
                fontFamily: 'SolmoeFont',
                fontSize: 20,
                color: Color(0xFFEDEAE6),
              ),
            ),
          ),

          const Center(
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
        ],
      ),
    );
  }
}
