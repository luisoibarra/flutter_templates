import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../di/dependency_injection.dart';
import 'interceptors/token_interceptor.dart';

@LazySingleton()
class DioService {
  final Dio _client;
  Dio get client => _client;

  DioService(Dio client) : _client = client;

  static void configureDio(Dio client) {
    client.interceptors.add(locator<TokenInterceptor>());
    client.options.headers.addAll({
      "Content-Type": "application/json",
    });
  }
}
