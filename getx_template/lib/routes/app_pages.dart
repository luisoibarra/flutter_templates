import 'package:get/get.dart';
import '../modules/first/first_binding.dart';
import '../modules/first/first_page.dart';
import '../modules/initial/initial_binding.dart';
import '../modules/initial/initial_page.dart';
import '../routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const InitialPage(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AppRoutes.first,
      page: () => const FirstPage(),
      binding: FirstBinding(),
    ),
  ];
}
