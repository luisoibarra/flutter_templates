import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'logger_service.dart';
import 'package:logging/logging.dart';

@Singleton(as: LoggerService)
class BasicLoggerService implements LoggerService {
  @override
  void d(String info) {
    log(info, level: Level.SHOUT.value);
  }

  @override
  void e(String info) {
    log(info, level: Level.SEVERE.value);
  }

  @override
  void i(String info) {
    log(info, level: Level.INFO.value);
  }

  @override
  void w(String info) {
    log(info, level: Level.WARNING.value);
  }
}
