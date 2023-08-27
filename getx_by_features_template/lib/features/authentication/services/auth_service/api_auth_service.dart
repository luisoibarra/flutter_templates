import 'package:injectable/injectable.dart';

import '../../../../shared/services/hash_service/hash_service.dart';
import '../../../../shared/utils/service_result.dart';
import '../../models/dto/login_result.dart';
import 'api/dto/login_send_info.dart';
import 'api/dto/register_send_info.dart';
import 'api/rest_api_auth.dart';
import 'auth_service.dart';

@LazySingleton(as: AuthService)
class ApiAuthService implements AuthService {
  final RestApiAuth _autApi;
  final HashService _hash;

  ApiAuthService(this._autApi, this._hash);

  /// Apply a hash function to obfuscate the given [value].
  Future<ServiceResult<String?>> _hashValue(String value) {
    return _hash.sha512(value);
  }

  @override
  Future<ServiceResult<LoginResult?>> login(
    String email,
    String password,
  ) async {
    try {
      final hashedPassword = await _hashValue(password);
      if (hashedPassword.withErrors) {
        return ServiceResult(null, errors: hashedPassword.errors);
      }

      return ServiceResult(await _autApi.login(LoginSendInfo(
        password: hashedPassword.result!,
        email: email,
      )));
    } catch (e) {
      return ServiceResult(null, errors: [e.toString()]);
    }
  }

  @override
  Future<ServiceResult<void>> register({
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
    required String email,
    required String password,
    required String mobile,
  }) async {
    try {
      final hashedPassword = await _hashValue(password);
      if (hashedPassword.withErrors) {
        return ServiceResult(null, errors: hashedPassword.errors);
      }
      await _autApi.register(RegisterSendInfo(
        dateOfBirth: dateOfBirth,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: mobile,
        password: hashedPassword.result!,
        email: email,
      ));
      return ServiceResult(null);
    } catch (e) {
      return ServiceResult(null, errors: [e.toString()]);
    }
  }
}
