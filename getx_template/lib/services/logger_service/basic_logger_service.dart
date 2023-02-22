import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'logger_service.dart';

class BasicLoggerService extends GetxService implements LoggerService {
  final Logger _logger;

  BasicLoggerService() : _logger = Logger();

  @override
  void d(String message) {
    _logger.d(message);
  }

  @override
  void i(String message) {
    _logger.i(message);
  }

  @override
  void e(String message, dynamic error) {
    _logger.e(message, error);
  }
}
