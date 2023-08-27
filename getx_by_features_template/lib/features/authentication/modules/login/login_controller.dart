import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/base/base_controller.dart';
import '../../../home/routes/routes.dart';
import '../../routes/routes.dart';
import '../../services/auth_service/auth_service.dart';
import '../../services/auth_shared_preference_service/auth_shared_preferences.dart';

@Injectable()
class LoginController extends BaseController {
  final AuthService _auth;
  final AuthSharedPreferences _sharedPreferences;

  final email = "".obs;
  final password = "".obs;

  LoginController(
    super.navigation,
    super.errorNotifier,
    this._auth,
    this._sharedPreferences,
  );

  Future<void> signIn() async {
    final result = await _auth.login(email.value, password.value);
    if (result.withErrors) {
      errorNotifier.notifyError(result.errorString);
    } else {
      final tokenResult =
          await _sharedPreferences.saveToken(result.result!.token);
      if (tokenResult.withErrors) {
        errorNotifier.notifyError(tokenResult.errorString);
      } else {
        navigation.offAllNamed(HomeRoutes.home);
      }
    }
  }

  void forgotPassword() {
    // TODO Navigate to page
  }

  void signUp() {
    navigation.toNamed(AuthenticationRoutes.signUpForm);
  }
}
