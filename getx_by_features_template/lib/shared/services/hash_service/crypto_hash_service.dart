import 'dart:convert';

import 'package:crypto/crypto.dart' as crypto;
import 'package:injectable/injectable.dart';

import '../../utils/service_result.dart';
import 'hash_service.dart';

@LazySingleton(as: HashService)
class CryptoHashService implements HashService {
  @override
  Future<ServiceResult<String?>> sha512(String input) async {
    try {
      final inputBytes = utf8.encode(input);
      final inputDigest = crypto.sha512.convert(inputBytes);
      return ServiceResult(inputDigest.toString());
    } catch (e) {
      return ServiceResult(null, errors: [e.toString()]);
    }
  }

  @override
  Future<ServiceResult<String?>> sha1(String input) async {
    try {
      final inputBytes = utf8.encode(input);
      final inputDigest = crypto.sha1.convert(inputBytes);
      return ServiceResult(inputDigest.toString());
    } catch (e) {
      return ServiceResult(null, errors: [e.toString()]);
    }
  }
}
