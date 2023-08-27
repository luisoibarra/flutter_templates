import '../../../../shared/utils/service_result.dart';
import '../../models/dto/login_result.dart';

abstract class AuthService {
  Future<ServiceResult<LoginResult?>> login(
    String email,
    String password,
  );

  Future<ServiceResult<void>> register({
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
    required String email,
    required String password,
    required String mobile,
  });
}
