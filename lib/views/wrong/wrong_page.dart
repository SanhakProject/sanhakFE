import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../components/appbars/appbar_without_percent_bar.dart';
import '../../components/icons/small_icon_with_name.dart';
import '../../components/icons/wrong_icon_with_name.dart';
import '../../components/icons/wrong_icon_with_name_blur.dart';
import '../../components/permissions/permission_handler.dart';
import '../../controllers/game_screen_controller.dart';
import '../../controllers/instrument_page_controller.dart';
import '../../controllers/wrong_page_controller.dart';
import '../../provider.dart';
import '../home/home_screen.dart';
import '../rule/rule_bottom_button.dart';
import 'components/bottom_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: WrongPage(),
    );
  }
}

class WrongPage extends StatefulWidget {
  const WrongPage({super.key});

  @override
  State<WrongPage> createState() => _WrongPageState();
}

class _WrongPageState extends State<WrongPage> {
  final controller = Get.find<WrongPageController>();
  final gameController = Get.find<GameScreenController>();
  final instrumentController = Get.find<InstrumentPageController>();

  @override
  void initState() {
    super.initState();
    controller.fetchTotalNotes();
  }

  Widget buildLine(int lineIndex) {
    final max = gameController.oneLineMeasure.value;

    if (lineIndex >= controller.actualNotes.length) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < max; i++) SizedBox(width: 70),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < max; i++)
          controller.actualNotes[lineIndex][i] != ''
              ? (controller.playedNotes[lineIndex][i] == 'correct'
                  ? SmallIconWithName(
                      name: controller.actualNotes[lineIndex][i],
                      instrument: instrumentController.instrumentName.value,
                    )
                  : WrongIconWithName(
                      name: controller.actualNotes[lineIndex][i],
                      instrument: instrumentController.instrumentName.value,
                    ))
              : (controller.playedNotes[lineIndex][i] == 'correct'
                  ? SizedBox(width: 70)
                  : WrongIconWithNameBlur(
                      name: controller.actualNotes[lineIndex][i],
                      instrument: instrumentController.instrumentName.value,
                    )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset('assets/images/background/배경화면2.png', fit: BoxFit.cover)),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBarWithoutPercentBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: Obx(() {
              return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      "${controller.displayedNumber.value + 1}",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                    Expanded(child: buildLine(controller.displayedNumber.value)),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "${controller.displayedNumber.value + 2}",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                    Expanded(child: buildLine(controller.displayedNumber.value + 1)),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "${controller.displayedNumber.value + 3}",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                    Expanded(child: buildLine(controller.displayedNumber.value + 2)),
                  ],
                ),
              ],
              );
            })
          ),
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RuleBottomButton(),
              Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: Row(
                  children: [
                    BottomButton(buttonName: '이전 악보', onPressed: () {
                      if (controller.displayedNumber.value != 0) {
                        controller.previousPage();
                      }
                    },),
                    Obx(() {
                      return Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child:
                          controller.displayedNumber.value < controller.playedNotes.length - 3
                              ? BottomButton(buttonName: '다음 악보', onPressed: () {
                            controller.nextPage();
                          })
                              : BottomButton(buttonName: '홈으로', onPressed: () {
                            Get.offAll(() => HomeScreen());
                          })
                      );
                    })
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
