import 'package:flutter/material.dart';

import 'exit_dialog.dart';

class BottomButtons extends StatelessWidget{
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Spacer(),
        Image.asset(
          'assets/images/buttons/모범연주듣기.png',
          width: 150,
        ),
        SizedBox(width: 20,),
        Image.asset(
          'assets/images/buttons/내연주듣기.png',
          width: 150,
        ),
        SizedBox(width: 40,),
      ],
    );
  }
}