import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackIconAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackIconAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          onPressed: () => Get.back(), 
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white,)
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}