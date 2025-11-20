import 'package:flutter/material.dart';

class WrongIconWithNameBlur extends StatelessWidget {
  final String name;
  final String instrument;
  const WrongIconWithNameBlur({super.key,
    required this.name,
    required this.instrument
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/images/icons/wrong_$instrument.png',
              width: 60,
            ),
          ),
          Positioned(
              top: 13.33333,
              left: 20,
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = Colors.red,
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.3,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
          )
        ]
    );
  }
}