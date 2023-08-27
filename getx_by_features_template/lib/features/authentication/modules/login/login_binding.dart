import 'package:get/get.dart';

import '../../../../shared/di/dependency_injection.dart';
import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => locator<LoginController>(),
    );
  }
}
