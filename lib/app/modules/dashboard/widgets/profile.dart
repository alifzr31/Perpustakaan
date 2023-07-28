import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpustakaan/app/core/values/colors.dart';
import 'package:perpustakaan/app/data/providers/auth_provider.dart';
import 'package:perpustakaan/app/modules/auth/controller.dart';
import 'package:perpustakaan/app/modules/dashboard/controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: greenColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ProfileBody(),
          ],
        ),
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  ProfileBody({super.key});
  final controller = Get.find<DashboardController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: greenColor,
                  foregroundColor: orangeColor,
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
                const SizedBox(width: 20),
                Obx(
                  () => Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.user.value?.name ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: const TextStyle(
                            color: greenColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          controller.user.value?.email ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: const TextStyle(
                            color: greenColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkResponse(
                  onTap: () {
                    authController.logout(context);
                  },
                  child: const CircleAvatar(
                    backgroundColor: greenColor,
                    foregroundColor: orangeColor,
                    radius: 80,
                    child: Icon(Icons.power_settings_new, size: 100),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Log Out',
                  style: TextStyle(
                    color: greenColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
