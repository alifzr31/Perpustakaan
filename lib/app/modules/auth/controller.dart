import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpustakaan/app/core/values/loading.dart';
import 'package:perpustakaan/app/core/values/snackbar.dart';
import 'package:perpustakaan/app/data/providers/auth_provider.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final AuthProvider authProvider;

  AuthController({required this.authProvider});

  final formKeyLogin = GlobalKey<FormState>().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  var showPassLogin = true.obs;

  final formKeyRegister = GlobalKey<FormState>().obs;
  final nameRegistController = TextEditingController().obs;
  final emailRegistController = TextEditingController().obs;
  final passwordRegistController = TextEditingController().obs;
  final passwordConfirmController = TextEditingController().obs;
  var showPass = true.obs;
  var showPassConfirm = true.obs;

  // @override
  // void onClose() {
  //   emailController.value.dispose();
  //   passwordController.value.dispose();
  //   nameRegistController.value.dispose();
  //   emailRegistController.value.dispose();
  //   passwordRegistController.value.dispose();
  //   passwordConfirmController.value.dispose();
  //   super.onClose();
  // }

  void login(BuildContext context) async {
    final formData = dio.FormData.fromMap({
      'email': emailController.value.text,
      'password': passwordController.value.text,
    });

    showLoading(context);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      final response = await authProvider.login(formData);
      successSnackbar(
          'Log In Berhasil', "Selamat datang ${response.data['user']['name']}");
      sharedPreferences.setString('token', response.data['token']);
      sharedPreferences.setInt('user_id', response.data['user']['id']);
      Get.offAllNamed('/dashboard');
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Ups Terjadi Kesalahan', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar('Log In Gagal', e.response?.data['message']);
      }
    }
  }

  void register(BuildContext context) async {
    final formData = dio.FormData.fromMap({
      'name': nameRegistController.value.text,
      'email': emailRegistController.value.text,
      'password': passwordRegistController.value.text,
      'password_confirmation': passwordConfirmController.value.text,
    });

    showLoading(context);

    try {
      final response = await authProvider.register(formData);
      Get.back();
      successSnackbar('Register Berhasil',
          "Silahkan log in dengan email ${response.data['data']['email']}");
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Ups Terjadi Kesalahan', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar('Register Gagal', e.response?.data['message']);
      }
    }
  }

  Future<void> logout(BuildContext context) async {
    showLoading(context);

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    infoSnackbar('Log Out Berhasil', 'Sampai jumpa di lain waktu');
    Get.offAllNamed('/auth');
    // try {
    //   final response = await authProvider.logout();
    //   infoSnackbar('Log Out Berhasil', 'Sampai jumpa di lain waktu');
    //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //   sharedPreferences.clear();
    //   Get.offAllNamed('/auth');
    // } on dio.DioException catch (e) {
    //   Get.back();
    //   if (e.response?.statusCode == 500) {
    //     failedSnackbar(
    //         'Ups Terjadi Kesalahan', e.response?.data.toString() ?? '');
    //   } else {
    //     infoSnackbar('Log Out Gagal', e.response?.data.toString() ?? '');
    //   }
    // }
  }
}
