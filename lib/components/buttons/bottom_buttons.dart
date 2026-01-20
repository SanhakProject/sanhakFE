import 'package:flutter/material.dart';

import 'exit_dialog.dart';

class BottomButtons extends StatelessWidget{
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          SizedBox(width: 70,),
          GestureDetector(
            onTap: () {
              exitDialog();
            },
            child: Image.asset(
              'assets/images/buttons/나가기.png',
              width: 88,
            ),
          ),
        ],
      ),
    );
  }
}