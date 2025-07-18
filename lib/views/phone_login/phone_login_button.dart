import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanhak/views/home/home_screen.dart';

import '../../controllers/login_page_controller.dart';

class PhoneLoginButtons extends StatelessWidget {
  final controller = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    
    return Column(
      children: [
        Container(
          width: width * 0.3,
          height: height * 0.11,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: '전화번호',
              hintStyle: TextStyle(color: Color(0xffEDD154)),
              filled: true,
              fillColor: Colors.black54,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 0.7,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Color(0xffC1C1C1),
                  width: 0.4,
                  ),
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: height * 0.02),
        Container(
          width: width * 0.3,
          height: height * 0.11,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: '비밀번호',
              hintStyle: TextStyle(color: Color(0xffEDD154)),
              filled: true,
              fillColor: Colors.black54,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 0.7,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Color(0xffC1C1C1),
                  width: 0.4,
                  ),
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: height * 0.02),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(width*0.3, height * 0.11),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {
            Get.to(() => HomeScreen());
          },
          child: const Text(
            '로그인',
            style: TextStyle(
              color: Color(0xff023859), 
              fontSize: 16,
              fontWeight: FontWeight.bold,
              ),
          ),
        ),
      ]
    );
  }
}