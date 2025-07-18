import 'package:get/get.dart';

import 'controllers/check_decibel_page.controller.dart';
import 'controllers/instrument_page_controller.dart';
import 'controllers/login_page_controller.dart';

void initControllers() {
  Get.put(LoginPageController());
  Get.put(InstrumentPageController());
  Get.put(CheckDecibelPageController());
}