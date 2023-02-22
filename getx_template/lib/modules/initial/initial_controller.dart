import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../services/navigation_service/navigation_service.dart';
import '../../services/register_service/register_service.dart';

class InitialController extends GetxController {
  final _register = Get.find<RegisterService>();

  @override
  void onInit() {
    super.onInit();
    _register.registerServices();
    _register.initServices().then((value) {
      final navigation = Get.find<NavigationService>();
      navigation.offNamed(AppRoutes.first);
    });
  }
}
