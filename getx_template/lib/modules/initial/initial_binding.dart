import 'package:get/get.dart';
import 'initial_controller.dart';
import '../../services/register_service/get_register_service.dart';
import '../../services/register_service/register_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InitialController());
    Get.lazyPut<RegisterService>(() => GetRegisterService());
  }
}
