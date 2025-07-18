import 'package:flutter/material.dart';

class MusicButton extends StatefulWidget {
  const MusicButton({super.key});

  @override
  State<MusicButton> createState() => _MusicButtonState();
}

class _MusicButtonState extends State<MusicButton> {
  final PageController _pageController = PageController(
    viewportFraction: 0.3,
    initialPage: 1,
  );
  
  int _currentIndex = 1;
  
  final List<Map<String, dynamic>> musics = [
    {'title': '아리랑', 'level': '어려움', 'accuracy': 0},
    {'title': '별달거리', 'level': '보통', 'accuracy': 80},
    {'title': '영남농악', 'level': '어려움', 'accuracy': 50},
    {'title': '휘모리', 'level': '쉬움', 'accuracy': 100},
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    
    return Column(
      children: [
        SizedBox(
          height: height * 0.57,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: musics.length,
            itemBuilder: (context, index) {
              final item = musics[index];
              final isCenter = index == _currentIndex;
              
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(
                  horizontal: isCenter ? 20 : 35,
                  vertical: isCenter ? 0 : 30,
                ),
                  decoration: BoxDecoration(
                    gradient: isCenter
                      ? LinearGradient(
                          colors: [
                            Color(0xFFEDD154).withAlpha(200),
                            Color(0xFFFEE500).withAlpha(150),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      : null,
                        color: isCenter 
                          ? null 
                          : Colors.white.withAlpha(200),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(25),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: isCenter ? _buildCenterCard(item) : _buildSideCard(item),
              );
            },
          ),
        ),
        SizedBox(height: height * 0.02),

          TextButton(
            onPressed: () {
              // 연주하러 가기 로직
          
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.015, 
                vertical: height * 0.013
                ),
            ),
            child: Text(
              '연주하러 가기',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Color(0xffFEE500),
                    blurRadius: 30,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCenterCard(Map<String, dynamic> item) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02, 
        vertical: height * 0.02
        ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDifficultyButton('쉬움', item['level'] == '쉬움'),
                  SizedBox(width: width * 0.005),
                  _buildDifficultyButton('보통', item['level'] == '보통'),
                  SizedBox(width: width * 0.005),
                  _buildDifficultyButton('어려움', item['level'] == '어려움'),
                ],
              ),
              SizedBox(height: height * 0.12),
              Center(
                child: Text(
                  item['title']!,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),  
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Text(
              '${item['accuracy']}% 정확도',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSideCard(Map<String, dynamic> item) {
    return Center(
      child: Text(
        item['title']!,
        style: const TextStyle(
          fontSize: 28,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildDifficultyButton(String text, bool isSelected) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.065,
      // padding: EdgeInsets.symmetric(horizontal: width * 0.005, vertical: height * 0.005),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? Colors.black : Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}