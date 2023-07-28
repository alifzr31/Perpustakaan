import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpustakaan/app/core/values/loading.dart';
import 'package:perpustakaan/app/core/values/snackbar.dart';
import 'package:perpustakaan/app/data/models/buku.dart';
import 'package:perpustakaan/app/data/providers/buku_provider.dart';

class BukuController extends GetxController {
  final BukuProvider bukuProvider;

  BukuController({required this.bukuProvider});

  var buku = <Buku>[].obs;
  var loadingBuku = true.obs;

  var loadingDetailBuku = false.obs;
  var detailBuku = Rx<Buku?>(null);
  final id = ''.obs;

  final createFormKey = GlobalKey<FormState>().obs;
  final judulController = TextEditingController().obs;
  final tahunTerbit = ''.obs;
  final pengarangController = TextEditingController().obs;
  final penerbitController = TextEditingController().obs;

  final updateFormKey = GlobalKey<FormState>().obs;
  final judulUpdateController = TextEditingController().obs;
  final tahunTerbitUpdate = ''.obs;
  final pengarangUpdateController = TextEditingController().obs;
  final penerbitUpdateController = TextEditingController().obs;

  @override
  void onInit() {
    fetchBuku();
    super.onInit();
  }

  Future<void> fetchBuku() async {
    try {
      final response = await bukuProvider.fetchBuku();
      final List<Buku> body = response.data['data'] == null
          ? []
          : listBukuFromJson(jsonEncode(response.data['data']));

      buku.value = body;
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Ups Terjadi Kesalahan', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar('Load Data Buku Gagal', e.response?.data.toString() ?? '');
      }
    } finally {
      loadingBuku.value = false;
      update();
    }
  }

  Future<void> fetchDetailBuku() async {
    loadingDetailBuku.value = true;

    try {
      final response = await bukuProvider.fetchDetailBuku(id.value);
      detailBuku.value = bukuFromJson(jsonEncode(response.data['data']));
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Ups Terjadi Kesalahan', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar(
            'Load Detail Data Buku Gagal', e.response?.data.toString() ?? '');
      }
    } finally {
      loadingDetailBuku.value = false;
      update();
    }
  }

  void createBuku(BuildContext context) async {
    final formData = dio.FormData.fromMap({
      'judul': judulController.value.text,
      'tahun_terbit': tahunTerbit.value,
      'pengarang': pengarangController.value.text,
      'penerbit': penerbitController.value.text,
    });

    showLoading(context);

    try {
      await bukuProvider.createBuku(formData);
      successSnackbar('Tambah Buku Berhasil',
          '${judulController.value.text} berhasil ditambahkan');
      Get.offAllNamed('/dashboard');
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Ups Terjadi Kesalahan', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar('Tambah Buku Gagal', e.response?.data.toString() ?? '');
      }
    }
  }

  void updateBuku(BuildContext context) async {
    final formData = dio.FormData.fromMap({
      'judul': judulUpdateController.value.text,
      'tahun_terbit': tahunTerbitUpdate.value,
      'pengarang': pengarangUpdateController.value.text,
      'penerbit': penerbitUpdateController.value.text,
    });

    showLoading(context);

    try {
      await bukuProvider.updateBuku(formData, id.value);
      successSnackbar('Edit Buku Berhasil',
          '${judulUpdateController.value.text} berhasil diupdate');
      Get.offAllNamed('/dashboard');
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Ups Terjadi Kesalahan', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar('Tambah Buku Gagal', e.response?.data.toString() ?? '');
      }
    }
  }

  Future<void> deleteBuku(BuildContext context) async {
    showLoading(context);

    try {
      final response = await bukuProvider.deleteBuku(id.value);

      if (response.data['success'] == true) {
        Get.back();
        successSnackbar('Hapus Buku Berhasil',
            '${response.data['data']['judul']} berhasil dihapus');
      }
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Ups Terjadi Kesalahan', e.response?.data.toString() ?? '');
      } else {
        infoSnackbar('Tambah Buku Gagal', e.response?.data.toString() ?? '');
      }
    } finally {
      fetchBuku();
    }
  }
}
