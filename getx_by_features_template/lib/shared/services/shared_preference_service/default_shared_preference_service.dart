import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/service_result.dart';
import 'shared_preference_service.dart';

@LazySingleton(as: SharedPreferenceService)
class DefaultSharedPreferenceService implements SharedPreferenceService {
  final SharedPreferences _sharedPreference;

  DefaultSharedPreferenceService(this._sharedPreference);

  @override
  Future<ServiceResult<void>> deleteKey(String key) async {
    try {
      await _sharedPreference.remove(key);
      return ServiceResult(null);
    } catch (e) {
      return ServiceResult(null, errors: [e.toString()]);
    }
  }

  @override
  Future<ServiceResult<bool?>> getBool(String key) async {
    try {
      final value = _sharedPreference.getBool(key);
      return ServiceResult(value);
    } catch (e) {
      return ServiceResult(null, errors: [e.toString()]);
    }
  }

  @override
  Future<ServiceResult<int?>> getInt(String key) async {
    try {
      final value = _sharedPreference.getInt(key);
      return ServiceResult(value);
    } catch (e) {
      return ServiceResult(null, errors: [e.toString()]);
    }
  }

  @override
  Future<ServiceResult<String?>> getString(String key) async {
    try {
      final value = _sharedPreference.getString(key);
      return ServiceResult(value);
    } catch (e) {
      return ServiceResult(null, errors: [e.toString()]);
    }
  }

  @override
  Future<ServiceResult<void>> saveBool(String key, bool value) async {
    try {
      await _sharedPreference.setBool(key, value);
      return ServiceResult(null);
    } catch (e) {
      return ServiceResult(null, errors: [e.toString()]);
    }
  }

  @override
  Future<ServiceResult<void>> saveInt(String key, int value) async {
    try {
      await _sharedPreference.setInt(key, value);
      return ServiceResult(null);
    } catch (e) {
      return ServiceResult(null, errors: [e.toString()]);
    }
  }

  @override
  Future<ServiceResult<void>> saveString(String key, String value) async {
    try {
      await _sharedPreference.setString(key, value);
      return ServiceResult(null);
    } catch (e) {
      return ServiceResult(null, errors: [e.toString()]);
    }
  }
}
