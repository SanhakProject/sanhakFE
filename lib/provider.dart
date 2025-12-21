import 'package:get/get.dart';

import 'controllers/check_decibel_page.controller.dart';
import 'controllers/game_screen_controller.dart';
import 'controllers/record_screen_controller.dart';
import 'controllers/rule_game_controller.dart';
import 'controllers/instrument_page_controller.dart';
import 'controllers/login_page_controller.dart';
import 'controllers/music_controller.dart';
import 'controllers/result_screen_controller.dart';
import 'controllers/wrong_page_controller.dart';

void initControllers() {
  Get.put(LoginPageController());
  Get.put(InstrumentPageController());
  Get.put(CheckDecibelPageController());
  Get.put(GameScreenController());
  Get.put(RuleGameController());
  Get.put(MusicController());
  Get.put(WrongPageController());
  Get.put(ResultScreenController());
  Get.put(RecordScreenController());
}