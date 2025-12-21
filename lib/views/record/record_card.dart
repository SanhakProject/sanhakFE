import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../result/result_screen.dart';

class RecordCard extends StatelessWidget {
  const RecordCard({
    super.key,
    required this.title,
    required this.level,
    required this.accuracy,
    required this.playedAt,
    required this.isCenter,
  });

  final String title;
  final String level;
  final int accuracy;
  final String playedAt;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      // 마진 때문에 내부 공간이 좁아져서 오버플로우 날 수 있음 -> 클립 설정 추가
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(
        horizontal: isCenter ? 20 : 35,
        vertical: isCenter ? 0 : 30,
      ),
      decoration: BoxDecoration(
        gradient: isCenter
            ? LinearGradient(
          colors: [
            const Color(0xFFEDD154).withAlpha(200),
            const Color(0xFFFEE500).withAlpha(150),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
            : null,
        color: isCenter ? null : Colors.white.withAlpha(200),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: isCenter
          ? _CenterCardContent(
        title: title,
        level: level,
        accuracy: accuracy,
        playedAt: playedAt,
      )
          : _SideCardContent(title: title),
    );
  }
}

class _CenterCardContent extends StatelessWidget {
  const _CenterCardContent({
    required this.title,
    required this.level,
    required this.accuracy,
    required this.playedAt,
  });

  final String title;
  final String level;
  final int accuracy;
  final String playedAt;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardHeight = constraints.maxHeight;
        final cardWidth = constraints.maxWidth;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: cardWidth * 0.06, // 좌우 여백을 조금 넉넉히
            vertical: cardHeight * 0.03,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 기본 왼쪽 정렬
                children: [
                  SizedBox(height: cardHeight * 0.15), // 상단 칩 공간 확보

                  // 1. 제목 (화면 중앙)
                  Expanded(
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 34, // 제목도 시원하게 키움
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 2. 하단 정보 영역 (날짜와 정확도를 수직으로 배치)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // 가로 꽉 차게
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // (1) 날짜 (위쪽, 왼쪽 정렬)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '기록일 $playedAt',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: cardHeight * 0.01), // 날짜와 정확도 사이 간격

                      // (2) 정확도 (아래쪽, 오른쪽 정렬, 강조)
                      Align(
                        alignment: Alignment.centerRight,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text('$accuracy% 정확도'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // 좌측 상단 난이도 칩
              Positioned(
                top: 0,
                left: 0,
                child: _DifficultyChip(text: level),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SideCardContent extends StatelessWidget {
  const _SideCardContent({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title,
            style: const TextStyle(fontSize: 28, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class _DifficultyChip extends StatelessWidget {
  const _DifficultyChip({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    // [핵심 2] 고정 width 제거하고 padding으로 감싸기
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13, // 폰트 사이즈 살짝 조절
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}