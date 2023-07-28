import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:perpustakaan/app/components/base_button.dart';
import 'package:perpustakaan/app/components/base_datepicker.dart';
import 'package:perpustakaan/app/components/base_textarea.dart';
import 'package:perpustakaan/app/components/base_textform.dart';
import 'package:perpustakaan/app/core/values/colors.dart';
import 'package:perpustakaan/app/modules/buku/controller.dart';

class CreateBukuPage extends StatelessWidget {
  const CreateBukuPage({super.key});

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
                  'Tambah Data Buku',
                  style: TextStyle(
                    color: greenColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            CreateBukuForm(),
          ],
        ),
      ),
    );
  }
}

class CreateBukuForm extends StatelessWidget {
  CreateBukuForm({super.key});
  final controller = Get.find<BukuController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Obx(
                () => Form(
                  key: controller.createFormKey.value,
                  child: Column(
                    children: [
                      BaseTextArea(
                        controller: controller.judulController.value,
                        label: 'Judul',
                        maxLines: null,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Masukkan judul buku';
                          }
                          
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      BaseDatePicker(
                        label: 'Tahun Terbit',
                        onChanged: (value) {
                          final formatter = DateFormat('yyyy');
                          final tahun = formatter.format(value ?? DateTime(0000));
                          controller.tahunTerbit.value = tahun;
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Masukkan tahun terbit buku';
                          }
                          
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      BaseTextForm(
                        controller: controller.pengarangController.value,
                        label: 'Pengarang',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Masukkan nama pengarang buku';
                          }
                          
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      BaseTextForm(
                        controller: controller.penerbitController.value,
                        label: 'Penerbit',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Masukkan nama penerbit buku';
                          }
                          
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(10),
            child: BaseButton(
              bgColor: greenColor,
              fgColor: orangeColor,
              text: 'Tambah Data',
              onPressed: () {
                if (controller.createFormKey.value.currentState!.validate()) {
                  controller.createBuku(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
