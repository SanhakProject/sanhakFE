import 'package:flutter/material.dart';

class InstrumentButton extends StatelessWidget {
  const InstrumentButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final instruments = [
      {'name': '북', 'image': 'assets/images/icons/북.png'},
      {'name': '징', 'image': 'assets/images/icons/징.png'},
      {'name': '장구', 'image': 'assets/images/icons/장구.png'},
      {'name': '꽹꽈리', 'image': 'assets/images/icons/꽹과리.png'},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: instruments.map((instrument) {
        return Padding(
          padding: EdgeInsets.only(right: width * 0.015),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(15)
            ),
            width: 163,
            height: 163,
            child: Stack(
              children: [
                Positioned(
                  top: 35,
                  left: 12,
                  child: Image.asset(
                    instrument['image']!,
                    width: 130,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          instrument['name']!,
                          style: TextStyle(
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
