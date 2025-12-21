import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/record_screen_controller.dart';
import 'record_card.dart';

class RecordCarousel extends StatefulWidget {
  const RecordCarousel({super.key});

  @override
  State<RecordCarousel> createState() => _RecordCarouselState();
}

class _RecordCarouselState extends State<RecordCarousel> {
  final controller = Get.find<RecordScreenController>();
  final PageController _pageController = PageController(
    viewportFraction: 0.3,
    initialPage: 0,
  );

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    if (controller.records.isEmpty) {
      return SizedBox(
        height: height * 0.57,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.history, size: 100, color: Colors.white70),
              SizedBox(height: 16),
              Text('아직 기록이 없습니다.',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
        ),
      );
    }

    return SizedBox(
      height: height * 0.57,
      child: PageView.builder(
        controller: _pageController,
        padEnds: true, // 처음 진입 시 왼쪽이 비도록 패딩 유지
        onPageChanged: (index) => setState(() => _currentIndex = index),
        itemCount: controller.records.length,
        itemBuilder: (context, index) {
          final item = controller.records[index];
          final isCenter = index == _currentIndex;

          return RecordCard(
            title: item['title'] as String,
            level: item['level'] as String,
            accuracy: item['accuracy'] as int,
            playedAt: item['playedAt'] as String,
            isCenter: isCenter,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
