import 'package:get/get.dart';
import '../../services/logger_service/logger_service.dart';

class FirstController extends GetxController {
  final _logger = Get.find<LoggerService>();

  final counter = 0.obs;

  @override
  void onInit() {
    // Initialization
    super.onInit();
  }

  @override
  void onClose() {
    // Called when closed
    super.onClose();
  }

  onButtonClicked() {
    counter.value += 1;
  }
}
