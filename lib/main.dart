import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'components/permissions/permission_handler.dart';
import 'provider.dart';
import 'views/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 환경변수 로드
  await dotenv.load(fileName: ".env");

  // 카카오 SDK 초기화
  KakaoSdk.init(
    nativeAppKey: dotenv.env['KAKAO_NATIVE_APP_KEY']!,
  );

  await SystemChrome.setPreferredOrientations([  /// 화면 가로 고정
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);  // 기기 앱바 무시
  await requestMicPermission();
  initControllers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SolmoeFont'),
      home: LoginScreen(),
    );
  }
}