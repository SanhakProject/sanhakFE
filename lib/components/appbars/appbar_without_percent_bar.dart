import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/instrument_page_controller.dart';

class AppBarWithoutPercentBar extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithoutPercentBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<InstrumentPageController>();
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white,)
      ),
      title: Row(
        children: [
          Text(
            "${controller.songName.value} - ${controller.instrumentName.value}",
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