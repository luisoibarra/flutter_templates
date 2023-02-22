import 'package:get/get.dart';
import '../logger_service/basic_logger_service.dart';
import '../logger_service/logger_service.dart';
import '../messenger_service/messenger_service.dart';
import '../messenger_service/stream_messenger_service.dart';
import '../navigation_service/getx_navigation_service.dart';
import '../navigation_service/navigation_service.dart';
import '../register_service/register_service.dart';

class GetRegisterService extends GetxService implements RegisterService {
  @override
  void registerServices() {
    Get.lazyPut<MessengerService>(() => StreamMessengerService());

    Get.lazyPut<LoggerService>(() => BasicLoggerService());

    Get.lazyPut<NavigationService>(() => GetxNavigationService());
  }

  @override
  Future<void> initServices() async {
    // Async service initialization
  }
}
