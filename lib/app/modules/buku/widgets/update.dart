import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:perpustakaan/app/components/base_button.dart';
import 'package:perpustakaan/app/components/base_datepicker.dart';
import 'package:perpustakaan/app/components/base_textarea.dart';
import 'package:perpustakaan/app/components/base_textform.dart';
import 'package:perpustakaan/app/core/values/colors.dart';
import 'package:perpustakaan/app/data/models/buku.dart';
import 'package:perpustakaan/app/modules/buku/controller.dart';

class UpdateBukuPage extends StatelessWidget {
  const UpdateBukuPage({super.key});

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
                  'Edit Data Buku',
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
                () {
                  final Buku buku = Get.arguments;

                  final formatter = DateFormat('yyyy');

                  controller.judulUpdateController.value.text =
                      buku.judul ?? '';
                  DateTime initialDate =
                      DateTime(int.parse(buku.tahunTerbit ?? ''));
                  controller.pengarangUpdateController.value.text =
                      buku.pengarang ?? '';
                  controller.penerbitUpdateController.value.text =
                      buku.penerbit ?? '';
                  controller.id.value = buku.id.toString();
                  controller.tahunTerbitUpdate.value = formatter.format(initialDate);

                  return Form(
                    key: controller.createFormKey.value,
                    child: Column(
                      children: [
                        BaseTextArea(
                          controller: controller.judulUpdateController.value,
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
                          initialValue: initialDate,
                          initialDate: initialDate,
                          onChanged: (value) {
                            final tahun =
                                formatter.format(value ?? DateTime(0000));
                            controller.tahunTerbitUpdate.value = tahun;
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
                          controller:
                              controller.pengarangUpdateController.value,
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
                          controller: controller.penerbitUpdateController.value,
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
                  );
                },
              ),
            ),
          ),
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(10),
            child: BaseButton(
              bgColor: greenColor,
              fgColor: orangeColor,
              text: 'Edit Data',
              onPressed: () {
                if (controller.createFormKey.value.currentState!.validate()) {
                  controller.updateBuku(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
