import 'package:get/get.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';
import 'routes.dart';

abstract class HomePages {
  static final List<GetPage> pages = [
    GetPage(
      name: HomeRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
