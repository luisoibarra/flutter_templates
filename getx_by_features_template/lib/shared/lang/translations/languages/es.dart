import '../translation_keys.dart';

abstract class Spanish {
  static const Map<String, String> messages = {
    TranslationKeys.appName: "Nombre de App",
    TranslationKeys.error: "Error",
    TranslationKeys.passwordTooShort:
        "Contraseña corta. Se requiere como mínimo @min caracteres.",
    TranslationKeys.fieldRequired: "Campo requerido.",
    TranslationKeys.invalidEmail: "Correo electrónico inválido.",
    TranslationKeys.invalidPhone: "Número de teléfono inválido.",
  };
}
