import 'dart:developer';

import 'package:injectable/injectable.dart';

import 'logger_service.dart';

@LazySingleton(as: LoggerService)
class BasicLoggerService implements LoggerService {
  BasicLoggerService();

  @override
  void d(String message) {
    log("DEBUG: $message");
  }

  @override
  void i(String message) {
    log("INFO: $message");
  }

  @override
  void e(String message, Object? error) {
    log("ERROR: $message", error: error);
  }
}
