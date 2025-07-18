import 'package:flutter/material.dart';

class AppBarWithoutPercentBar extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithoutPercentBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Text(
            "별달거리 - 북",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}