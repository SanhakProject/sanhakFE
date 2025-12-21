import 'package:flutter/material.dart';
import 'package:sanhak/views/phone_register/phone_register_button.dart';
import '../../components/appbars/back_icon_appbar.dart';

class PhoneRegisterScreen extends StatelessWidget {
  const PhoneRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

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
          // 키보드가 올라올 때 화면이 줄어들어야 스크롤이 가능하므로 true로 변경 (혹은 삭제)
          resizeToAvoidBottomInset: true,
          appBar: BackIconAppBar(),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                // 키보드가 올라와서 화면이 가려질 때만 스크롤 됨
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight, // 최소 높이를 화면 높이만큼 강제
                  ),
                  child: IntrinsicHeight(
                    // IntrinsicHeight가 있어야 Spacer가 정상 작동함
                    child: Column(
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
                            ],
                          ),
                        ),
                        const Spacer(flex: 1),
                        PhoneRegisterButton(),
                        const Spacer(flex: 2),
                        SizedBox(height: height * 0.043),
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