import 'package:flutter/material.dart';
import 'package:sanhak/views/result/result_screen.dart'; // 결과 페이지 import

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
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        // ✅ 카드 클릭 시 ResultScreen으로 이동
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ResultScreen(),
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
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
      ),
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.02,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: height * 0.08),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  '기록일  $playedAt',
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  '$accuracy% 정확도',
                  style: const TextStyle(fontSize: 18, color: Colors.black87),
                ),
              ),
            ],
          ),
          // 좌측 상단 난이도 칩
          Positioned(
            top: height * 0.01,
            left: width * 0.01, // 👉 살짝 더 왼쪽으로
            child: _DifficultyChip(text: level),
          ),
        ],
      ),
    );
  }
}

class _SideCardContent extends StatelessWidget {
  const _SideCardContent({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 28, color: Colors.black),
      ),
    );
  }
}

class _DifficultyChip extends StatelessWidget {
  const _DifficultyChip({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.065, // MusicButton과 동일 비율
      decoration: BoxDecoration(
        color: Colors.black, // 항상 선택된 상태
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: height * 0.005),
      child: Center(
        child: Text(
          text, // '쉬움' / '보통' / '어려움'
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
