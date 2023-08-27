import '../../utils/service_result.dart';

abstract class HashService {
  Future<ServiceResult<String?>> sha512(String input);
  Future<ServiceResult<String?>> sha1(String input);
}
