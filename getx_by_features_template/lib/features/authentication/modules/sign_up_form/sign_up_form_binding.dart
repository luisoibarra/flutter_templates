import 'package:get/get.dart';

import '../../../../shared/di/dependency_injection.dart';
import 'sign_up_form_controller.dart';

class SignUpFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpFormController>(
      () => locator<SignUpFormController>(),
    );
  }
}
