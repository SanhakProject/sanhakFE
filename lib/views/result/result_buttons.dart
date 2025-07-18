import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultButtons extends StatelessWidget {
  const ResultButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        SizedBox(
          width: 288,
          height: 45,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEDD154),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: const Text(
              '홈으로',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'SolmoeFont',
                color: Color(0xFF2C3342),
              ),
            ),
          ),
        ),

        const SizedBox(width: 150),

        SizedBox(
          width: 288,
          height: 45,
          child: ElevatedButton(
            onPressed: () {
              // TODO: 복습 기능
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEDD154),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: const Text(
              '틀린 부분 복습하기',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'SolmoeFont',
                color: Color(0xFFDB1912),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
