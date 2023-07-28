import 'package:get/get.dart';
import 'package:perpustakaan/app/modules/auth/binding.dart';
import 'package:perpustakaan/app/modules/auth/view.dart';
import 'package:perpustakaan/app/modules/buku/binding.dart';
import 'package:perpustakaan/app/modules/buku/widgets/create.dart';
import 'package:perpustakaan/app/modules/buku/widgets/update.dart';
import 'package:perpustakaan/app/modules/dashboard/binding.dart';
import 'package:perpustakaan/app/modules/dashboard/view.dart';
import 'package:perpustakaan/app/modules/splash/view.dart';
import 'package:perpustakaan/app/routes/routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: Routes.auth,
      page: () => const AuthPage(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
      transition: Transition.size,
    ),
    GetPage(
      name: Routes.create,
      page: () => const CreateBukuPage(),
      binding: BukuBinding(),
      transition: Transition.size,
    ),
    GetPage(
      name: Routes.update,
      page: () => const UpdateBukuPage(),
      binding: BukuBinding(),
      transition: Transition.size,
    ),
  ];
}
