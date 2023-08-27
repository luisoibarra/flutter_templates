import 'package:get/get.dart';

import '../../../../shared/di/dependency_injection.dart';
import 'startup_controller.dart';

class StartupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartupController>(
      () => locator<StartupController>(),
    );
  }
}
