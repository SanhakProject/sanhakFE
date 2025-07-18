import 'package:flutter/material.dart';
import 'package:sanhak/views/phone_register/phone_register_button.dart';

class PhoneRegisterScreen extends StatelessWidget {
  const PhoneRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/images/background/배경화면.png', fit: BoxFit.cover),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Spacer(flex: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 38.4),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Center(
                      child: Text(
                        '회원가입',
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 35
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 1),
              PhoneRegisterButton(),
              Spacer(flex: 2)
              // SizedBox(height: height * 0.043),
            ],
          ),
        )
      ],
    );
  }
}