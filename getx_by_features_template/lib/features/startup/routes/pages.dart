import 'package:get/get.dart';

import '../modules/startup/startup_binding.dart';
import '../modules/startup/startup_page.dart';
import 'routes.dart';

class StartupPages {
  static final List<GetPage> pages = [
    GetPage(
      name: StartupRoutes.startup,
      page: () => const StartupPage(),
      binding: StartupBinding(),
    ),
  ];
}
