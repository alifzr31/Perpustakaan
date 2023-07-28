import 'package:get/get.dart';
import 'package:perpustakaan/app/data/providers/buku_provider.dart';
import 'package:perpustakaan/app/modules/buku/controller.dart';

class BukuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BukuProvider>(() => BukuProvider());
    Get.lazyPut<BukuController>(() => BukuController(bukuProvider: Get.find()));
  }
}
