import 'package:flutter/material.dart';
import 'record_card.dart';

class RecordCarousel extends StatefulWidget {
  const RecordCarousel({super.key});

  @override
  State<RecordCarousel> createState() => _RecordCarouselState();
}

class _RecordCarouselState extends State<RecordCarousel> {
  final PageController _pageController = PageController(
    viewportFraction: 0.3,
    initialPage: 0,
  );

  int _currentIndex = 0;

  final List<Map<String, dynamic>> records = [
    {'title': '아리랑',   'level': '어려움', 'accuracy': 92, 'playedAt': '2025.08.21 14:32'},
    {'title': '별달거리', 'level': '보통',   'accuracy': 80, 'playedAt': '2025.08.20 20:11'},
    {'title': '영남농악', 'level': '어려움', 'accuracy': 55, 'playedAt': '2025.08.18 18:07'},
    {'title': '휘모리',   'level': '쉬움',   'accuracy': 100,'playedAt': '2025.08.15 10:24'},
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    if (records.isEmpty) {
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
        itemCount: records.length,
        itemBuilder: (context, index) {
          final item = records[index];
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
