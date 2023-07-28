import 'package:get/get.dart';
import 'package:perpustakaan/app/data/providers/auth_provider.dart';
import 'package:perpustakaan/app/data/providers/buku_provider.dart';
import 'package:perpustakaan/app/data/providers/dashboard_provider.dart';
import 'package:perpustakaan/app/modules/auth/controller.dart';
import 'package:perpustakaan/app/modules/buku/controller.dart';
import 'package:perpustakaan/app/modules/dashboard/controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardProvider>(() => DashboardProvider());
    Get.lazyPut<DashboardController>(() => DashboardController(dashboardProvider: Get.find()));

    Get.lazyPut<BukuProvider>(() => BukuProvider());
    Get.lazyPut<BukuController>(() => BukuController(bukuProvider: Get.find()));

    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<AuthController>(() => AuthController(authProvider: Get.find()));
  }
}