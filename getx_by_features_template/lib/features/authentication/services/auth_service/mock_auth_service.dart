import 'package:injectable/injectable.dart';

import '../../../../shared/di/dependency_injection_envs.dart';
import '../../../../shared/utils/service_result.dart';
import '../../models/dto/login_result.dart';
import '../../models/user.dart';
import 'auth_service.dart';

@LazySingleton(as: AuthService, scope: DependencyInjectionEnvs.mock)
class MockAuthService implements AuthService {
  @override
  Future<ServiceResult<LoginResult?>> login(
      String email, String password) async {
    return ServiceResult(LoginResult(
        token: "token",
        user: User(
            id: '123',
            email: email,
            dateOfBirth: DateTime.now().subtract(Duration(days: 365 * 20)),
            firstName: "Test",
            lastName: "Last",
            mobileNumber: "SCAS")));
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
    return ServiceResult(null);
  }
}
