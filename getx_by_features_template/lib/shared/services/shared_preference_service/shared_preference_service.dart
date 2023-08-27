import '../../utils/service_result.dart';

abstract class SharedPreferenceService {
  Future<ServiceResult<String?>> getString(String key);
  Future<ServiceResult<void>> saveString(String key, String value);
  Future<ServiceResult<int?>> getInt(String key);
  Future<ServiceResult<void>> saveInt(String key, int value);
  Future<ServiceResult<bool?>> getBool(String key);
  Future<ServiceResult<void>> saveBool(String key, bool value);
  Future<ServiceResult<void>> deleteKey(String key);
}
