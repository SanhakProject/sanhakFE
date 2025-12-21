import 'package:flutter/material.dart';
import 'package:sanhak/views/phone_login/phone_login_button.dart';
import '../../components/appbars/back_icon_appbar.dart';

class PhoneLoginScreen extends StatelessWidget {
  const PhoneLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
              'assets/images/background/배경화면1.png',
              fit: BoxFit.cover
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          // 1. 키보드가 올라올 때 화면이 조정되도록 true로 변경
          resizeToAvoidBottomInset: true,
          appBar: BackIconAppBar(),
          // 2. 전체 높이 계산을 위한 LayoutBuilder
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                // 3. 최소 높이를 화면 전체 높이로 고정 (배경 꽉 차게)
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  // 4. Spacer가 작동하도록 IntrinsicHeight 사용
                  child: IntrinsicHeight(
                    child: Column(
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
                        const Spacer(flex: 4),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}