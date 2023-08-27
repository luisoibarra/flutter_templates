import 'package:get/get.dart';

import '../../../../shared/di/dependency_injection.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => locator<HomeController>(),
    );
  }
}
