import 'package:flutter/material.dart';

import '../../components/buttons/exit_dialog.dart';



class RuleBottomButton extends StatelessWidget {
  const RuleBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 10),
      child: SizedBox(
        height: 33,
        child: Row(
          children: [
            GestureDetector(
                  onTap: () {
                    exitDialog();
                  },
                  child: Image.asset(
                    'assets/images/buttons/나가기.png',
                  ),
                ),
          ],
        ),
      ),
    );
  }
}