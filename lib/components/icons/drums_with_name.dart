import 'package:flutter/material.dart';

class IconWithName extends StatelessWidget {
  final String name;
  const IconWithName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Image.asset(
            'assets/images/icons/북.png',
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