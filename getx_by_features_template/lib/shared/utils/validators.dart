import 'package:validators2/validators2.dart';

import '../lang/lang_service.dart';
import '../lang/translations/translation_keys.dart';

final _phoneRegex = RegExp(
    r'^\+?\d{1,3}[-\s]?\(?([0-9]{3})\)?[-\s]?([0-9]{3})[-\s]?([0-9]{4})$');

String? _isPhoneNumber(String value) {
  if (!_phoneRegex.hasMatch(value)) {
    return LanguageService.translate(TranslationKeys.invalidPhone);
  }
  return null;
}

abstract class Validators {
  static const minPasswordLength = 5;

  static String? validateMobileNumber(String? mobile) {
    final required = validateRequiredField(mobile);
    if (required != null) {
      return required;
    }
    return _isPhoneNumber(mobile!);
  }

  static String? validateEmail(String? email) {
    final required = validateRequiredField(email);
    if (required != null) {
      return required;
    }
    return isEmail(email!)
        ? null
        : LanguageService.translate(TranslationKeys.invalidEmail);
  }

  static String? validatePassword(String? password) {
    final required = validateRequiredField(password);
    if (required != null) {
      return required;
    }
    return password!.length >= minPasswordLength
        ? null
        : LanguageService.translate(TranslationKeys.passwordTooShort, {
            "min": minPasswordLength.toString(),
          });
  }

  static String? validateRequiredField(String? field) {
    return field?.isNotEmpty == true
        ? null
        : LanguageService.translate(TranslationKeys.fieldRequired);
  }

  static String? validateNumber(String value, {int? min}) {
    final finalVal = int.tryParse(value);
    if (finalVal != null) {
      if (min != null && finalVal < min) {
        return LanguageService.translate(TranslationKeys.invalidNumberMin, {
          "min": min.toString(),
        });
      }
      return null;
    }
    return LanguageService.translate(TranslationKeys.invalidNumberNaN);
  }
}
