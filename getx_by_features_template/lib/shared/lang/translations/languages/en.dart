import '../translation_keys.dart';

abstract class English {
  static const Map<String, String> messages = {
    TranslationKeys.appName: "App Name",
    TranslationKeys.error: "Error",
    TranslationKeys.passwordTooShort:
        "Password too short. Minimum @min characters required.",
    TranslationKeys.fieldRequired: "Field required.",
    TranslationKeys.invalidEmail: "Invalid email.",
    TranslationKeys.invalidPhone: "Invalid phone number.",
    TranslationKeys.invalidNumberNaN: "Invalid number.",
    TranslationKeys.invalidNumberMin: "Number can't be lower than @min.",
  };
}
