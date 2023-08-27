import 'package:injectable/injectable.dart';

import '../../../../shared/services/shared_preference_service/shared_preference_service.dart';
import '../../../../shared/utils/service_result.dart';

abstract class AuthSharedPreferenceKeys {
  static const tokenKey = "auth_token_key";
}

@LazySingleton()
class AuthSharedPreferences {
  final SharedPreferenceService _sharedPreferenceService;

  AuthSharedPreferences(this._sharedPreferenceService);

  Future<ServiceResult<void>> saveToken(String token) {
    return _sharedPreferenceService.saveString(
        AuthSharedPreferenceKeys.tokenKey, token);
  }

  Future<ServiceResult<String?>> getToken() {
    return _sharedPreferenceService
        .getString(AuthSharedPreferenceKeys.tokenKey);
  }
}
