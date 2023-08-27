import 'package:get/get.dart';

import '../services/error_notifier_service/error_notifier_service.dart';
import '../services/navigation_service/navigation_service.dart';

abstract class BaseController extends GetxController {
  final NavigationService navigation;
  final ErrorNotifierService errorNotifier;

  BaseController(this.navigation, this.errorNotifier);
}
