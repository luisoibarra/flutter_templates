import '../translation_keys.dart';

abstract class AuthenticationSpanish {
  static const Map<String, String> messages = {
    AuthTranslationKeys.login: "Login",
    AuthTranslationKeys.forgotPassword: "Olvidó la contraseña?",
    AuthTranslationKeys.dontHaveAccount: "¿No tiene una cuenta?",
    AuthTranslationKeys.signIn: "Ingresar",
    AuthTranslationKeys.signUp: "Registarse",
    AuthTranslationKeys.password: "Contraseña",
    AuthTranslationKeys.emailAddress: "Correo electrónico",
    AuthTranslationKeys.pleaseSignInToContinue:
        "Por favor ingrese para continuar",
  };
}
