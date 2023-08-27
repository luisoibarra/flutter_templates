import 'package:injectable/injectable.dart';

import '../../../../shared/services/auth_token_provider/auth_token_provider.dart';
import '../auth_shared_preference_service/auth_shared_preferences.dart';

@LazySingleton(as: AuthTokenProvider)
class DefaultAuthTokenProvider implements AuthTokenProvider {
  final AuthSharedPreferences _sharedPreferences;

  DefaultAuthTokenProvider(this._sharedPreferences);

  @override
  Future<String?> authToken() async {
    return (await _sharedPreferences.getToken()).result;
  }
}
