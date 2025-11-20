import 'package:flutter/material.dart';

class WrongIconWithName extends StatelessWidget {
  final String name;
  final String instrument;
  const WrongIconWithName({super.key,
    required this.name,
    required this.instrument
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Image.asset(
            'assets/images/icons/wrong_$instrument.png',
            width: 60,
          ),
          Positioned(
            top: 13.33333,
            left: 20,
            child: Stack(
              children: [
                // 1) 테두리(Stroke)
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color = Colors.red, // 테두리 색
                  ),
                ),

                // 2) 내부 채우기(Fill)
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white, // 내부 채우기 색
                  ),
                ),
              ],
            )
          )
        ]
    );
  }
}