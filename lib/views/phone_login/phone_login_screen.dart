import 'package:flutter/material.dart';
import 'package:sanhak/components/appbars/back_icon_appbar.dart';
import 'package:sanhak/views/phone_login/phone_login_button.dart';

/// 백 아이콘은 직접 넣는 것이 아닌 BackIconAppBar 사용 (components/appbar/back_icon_appbar.dart)

class PhoneLoginScreen extends StatelessWidget {
  const PhoneLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/images/background/배경화면1.png', fit: BoxFit.cover),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: BackIconAppBar(),
          body: Column(
            children: [
              const Spacer(flex: 3),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 38.4),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Center(
                      child: Text(
                        '로그인',
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 35
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 1),
              PhoneLoginButtons(),
              const Spacer(flex: 4,)
            ],
          ),
        )
      ],
    );
  }
}