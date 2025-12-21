import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/record_screen_controller.dart';
import 'record_carousel.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  final controller = Get.find<RecordScreenController>();

  @override
  void initState() {
    super.initState();
    controller.getResults();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/background/배경화면1.png',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            titleSpacing: 0,
            title: const Text(
              '지난 기록',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            centerTitle: false,
          ),
          body: Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: Text(
                    '정보를 불러오고 있습니다!\n잠시만 기다려주세요',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              );
            }

            return Column(
              children: [
                SizedBox(height: height * 0.06),
                const SizedBox(height: 20),
                const RecordCarousel(),
              ],
            );
          })
        ),
      ],
    );
  }
}
