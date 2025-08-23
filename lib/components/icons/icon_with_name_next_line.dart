import 'package:flutter/material.dart';

class IconWithNameNextLine extends StatelessWidget {
  final String name;
  final String instrument;
  const IconWithNameNextLine({super.key,
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
              'assets/images/icons/$instrument.png',
              width: 60,
            ),
          ),
          Positioned(
            top: 13.33333,
            left: 20,
            child: Opacity(
              opacity: 0.8,
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ]
    );
  }
}