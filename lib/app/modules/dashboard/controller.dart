import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:perpustakaan/app/core/values/snackbar.dart';
import 'package:perpustakaan/app/data/models/buku.dart';
import 'package:perpustakaan/app/data/models/user.dart';
import 'package:perpustakaan/app/data/providers/dashboard_provider.dart';

class DashboardController extends GetxController {
  final DashboardProvider dashboardProvider;

  DashboardController({required this.dashboardProvider});

  final currentIndex = 0.obs;

  var user = Rx<User?>(null);

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  Future<void> fetchProfile() async {
    try {
      final response = await dashboardProvider.fetchProfile();
      user.value = userFromJson(jsonEncode(response.data));
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Ups Terjadi Kesalahan', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar('Register Gagal', e.response?.data.toString() ?? '');
      }
    }
  }
}
