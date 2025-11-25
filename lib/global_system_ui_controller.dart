import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalSystemUIController with WidgetsBindingObserver {
  static final GlobalSystemUIController _instance = GlobalSystemUIController._internal();

  factory GlobalSystemUIController() => _instance;

  GlobalSystemUIController._internal();

  void init() {
    WidgetsBinding.instance.addObserver(this);

    // 앱 시작 시 immersive 적용
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;

    if (bottomInset == 0) {
      // 키보드 닫힘 → 하단바 자동 숨김
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      // 키보드 열림 → OS가 강제로 바를 띄움
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }
}