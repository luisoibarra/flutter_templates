import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/lang/lang_service.dart';
import '../../lang/translation_keys.dart';
import 'startup_controller.dart';

class StartupPage extends GetView<StartupController> {
  const StartupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (controller.loading.value) const CircularProgressIndicator(),
          Center(
            child: Text(
                "${controller.loading.value ? "" : "No "}${LanguageService.translate(StartupTranslationKeys.loading)}"),
          )
        ],
      );
    }));
  }
}
