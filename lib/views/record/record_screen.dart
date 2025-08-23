import 'package:flutter/material.dart';
import 'record_carousel.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/background/배경화면1.png',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            titleSpacing: 0,
            title: const Text(
              '지난 기록',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            centerTitle: false,
          ),
          body: Column(
            children: [
              SizedBox(height: height * 0.06),
              const SizedBox(height: 20),
              const RecordCarousel(),
            ],
          ),
        ),
      ],
    );
  }
}
