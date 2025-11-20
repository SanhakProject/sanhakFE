import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  const BottomButton({
    super.key,
    required this.buttonName,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFEDD154),
            foregroundColor: Color(0xFF2C3342),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30),
          ),
          onPressed: onPressed,
          child: Text(
            buttonName,
            style: TextStyle(
              fontSize: 20,
            ),
          )
      ),
    );
  }
}
