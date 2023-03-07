import 'package:injectable/injectable.dart';
import '../../injection.dart';
import 'counter_service.dart';
import '../logger/logger_service.dart';

@Singleton(as: CounterService)
class SimpleCounterService implements CounterService {
  final _logger = locator<LoggerService>();

  int _counter = 0;
  @override
  int get counter => _counter;

  @override
  void increment() {
    _counter++;
    _logger.i("Counter incremented: $_counter");
  }

  @override
  void decrement() {
    _counter--;
    _logger.i("Counter decremented: $_counter");
  }
}
