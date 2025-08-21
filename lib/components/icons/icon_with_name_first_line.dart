import 'package:flutter/material.dart';

class IconWithNameFirstLine extends StatelessWidget {
  final String name;
  final String instrument;
  const IconWithNameFirstLine({super.key,
    required this.name,
    required this.instrument,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Image.asset(
            'assets/images/icons/$instrument.png',
            width: 90,
          ),
          Positioned(
            top: 20,
            left: 30,
            child: Text(
              name,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          )
        ]
    );
  }
}