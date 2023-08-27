import 'package:get/get.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_page.dart';
import '../modules/sign_up_form/sign_up_form_binding.dart';
import '../modules/sign_up_form/sign_up_form_page.dart';
import 'routes.dart';

abstract class AuthenticationPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AuthenticationRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AuthenticationRoutes.signUpForm,
      page: () => const SignUpFormPage(),
      binding: SignUpFormBinding(),
    ),
  ];
}
