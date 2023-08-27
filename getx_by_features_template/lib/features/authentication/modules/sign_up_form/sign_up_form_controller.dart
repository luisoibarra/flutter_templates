import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/base/base_controller.dart';
import '../../routes/routes.dart';
import '../../services/auth_service/auth_service.dart';

@injectable
class SignUpFormController extends BaseController {
  final AuthService _auth;

  SignUpFormController(
    super.navigation,
    super.errorNotifier,
    this._auth,
  );

  final firstName = "".obs;
  final lastName = "".obs;
  final dateOfBirth = Rx<DateTime?>(null);
  final email = "".obs;
  final password = "".obs;
  final confirmPassword = "".obs;
  final mobile = "".obs;

  final personalDetailsValid = Rx<bool?>(null);

  void signIn() {
    navigation.offAllNamed(AuthenticationRoutes.login);
  }

  void signUp() async {
    final result = await _auth.register(
      firstName: firstName.value,
      lastName: lastName.value,
      dateOfBirth: dateOfBirth.value!,
      email: email.value,
      password: password.value,
      mobile: mobile.value,
    );
    if (result.withErrors) {
      errorNotifier.notifyError(result.errorString);
    } else {
      navigation.offAllNamed(AuthenticationRoutes.login);
    }
  }
}
