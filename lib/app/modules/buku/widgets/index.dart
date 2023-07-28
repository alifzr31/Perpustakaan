import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpustakaan/app/components/base_nodata.dart';
import 'package:perpustakaan/app/components/base_squarecard.dart';
import 'package:perpustakaan/app/core/values/colors.dart';
import 'package:perpustakaan/app/core/values/show_custombottomsheet.dart';
import 'package:perpustakaan/app/modules/buku/controller.dart';
import 'package:perpustakaan/app/modules/buku/widgets/detail.dart';

class IndexBukuPage extends StatelessWidget {
  IndexBukuPage({super.key});
  final controller = Get.find<BukuController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => controller.loadingBuku.value
            ? const Center(child: CircularProgressIndicator())
            : controller.buku.isEmpty
                ? BaseNoData(
                    size: 300,
                    onPressed: () async {
                      controller.loadingBuku.value = true;
                      controller.fetchBuku();
                    },
                  )
                : RefreshIndicator(
                  backgroundColor: greenColor,
                  color: orangeColor,
                  onRefresh: () async {
                    await Future.delayed(const Duration(milliseconds: 2500), () {
                      controller.fetchBuku();
                    });
                  },
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 5,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      itemCount: controller.buku.length,
                      itemBuilder: (context, index) {
                        final buku = controller.buku[index];

                        return BaseSquareCard(
                          title: buku.judul ?? '',
                          subtitle: buku.tahunTerbit ?? '',
                          onTap: () {
                            controller.id.value = buku.id.toString();
                            showCustomBottomSheet(300, const DetailBukuPage());
                          },
                        );
                      },
                    ),
                ),
      ),
    );
  }
}
