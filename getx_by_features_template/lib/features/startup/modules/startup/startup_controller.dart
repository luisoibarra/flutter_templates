import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/base/base_controller.dart';
import '../../../authentication/routes/routes.dart';
import '../../../authentication/services/auth_shared_preference_service/auth_shared_preferences.dart';
import '../../../home/routes/routes.dart';

@injectable
class StartupController extends BaseController {
  final AuthSharedPreferences _authPreference;

  StartupController(
      super.navigation, super.errorNotifier, this._authPreference);

  // Properties
  final loading = false.obs;

  // Methods
  @override
  void onInit() {
    super.onInit();
    loading.value = true;
    verifyAllAndContinue();
  }

  void verifyAllAndContinue() async {
    // Place some app initialization logic, like initial navigation
    // or complex service initialization

    // Verify the logged in status
    final token = await _authPreference.getToken();
    if (token.result == null) {
      navigation.offNamed(AuthenticationRoutes.login);
    } else {
      navigation.offNamed(HomeRoutes.home);
    }
  }
}
