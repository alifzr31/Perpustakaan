import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpustakaan/app/core/values/colors.dart';
import 'package:perpustakaan/app/modules/buku/controller.dart';

class DetailBukuPage extends StatefulWidget {
  const DetailBukuPage({super.key});

  @override
  State<DetailBukuPage> createState() => _DetailBukuPageState();
}

class _DetailBukuPageState extends State<DetailBukuPage> {
  final controller = Get.find<BukuController>();

  @override
  void initState() {
    controller.fetchDetailBuku();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.loadingDetailBuku.value
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        controller.detailBuku.value?.judul ?? '',
                        style: const TextStyle(
                          color: greenColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Pengarang',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                controller.detailBuku.value?.pengarang ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Container(
                                height: 2,
                                width: Get.width,
                                color: greenColor,
                                margin: const EdgeInsets.symmetric(vertical: 5),
                              ),
                              const Text(
                                'Penerbit',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                controller.detailBuku.value?.penerbit ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Container(
                                height: 2,
                                width: Get.width,
                                color: greenColor,
                                margin: const EdgeInsets.symmetric(vertical: 5),
                              ),
                              const Text(
                                'Tahun Terbit',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                controller.detailBuku.value?.tahunTerbit ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Container(
                                height: 2,
                                width: Get.width,
                                color: greenColor,
                                margin: const EdgeInsets.symmetric(vertical: 5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Get.toNamed('/update', arguments: controller.detailBuku.value);
                      },
                      label: const Text('Edit Data'),
                      icon: const Icon(Icons.edit),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Get.back();
                        controller.deleteBuku(context);
                      },
                      label: const Text('Delete Data'),
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
