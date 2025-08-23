import 'package:flutter/material.dart';

import '../../components/buttons/exit_dialog.dart';



class RuleBottomButton extends StatelessWidget {
  const RuleBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: () {
            exitDialog();
          },
          child: Image.asset(
            'assets/images/buttons/나가기.png',
            width: 88,
          ),
        );
  }
}