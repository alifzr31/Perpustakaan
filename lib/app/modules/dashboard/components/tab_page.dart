import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpustakaan/app/modules/dashboard/controller.dart';
import 'package:perpustakaan/app/modules/dashboard/widgets/home.dart';
import 'package:perpustakaan/app/modules/dashboard/widgets/profile.dart';

class TabPage extends StatelessWidget {
  TabPage({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IndexedStack(
        index: controller.currentIndex.value,
        children: const [
          HomeTab(),
          ProfileTab(),
        ],
      ),
    );
  }
}
