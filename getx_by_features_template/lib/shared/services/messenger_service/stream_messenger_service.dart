import 'dart:async';

import 'package:injectable/injectable.dart';

import '../logger_service/logger_service.dart';
import 'messages/base_message.dart';
import 'messenger_service.dart';

@LazySingleton(as: MessengerService)
class StreamMessengerService implements MessengerService {
  final StreamController _streamController;
  final LoggerService _logger;

  StreamMessengerService(this._logger)
      : _streamController = StreamController.broadcast();

  @override
  void publish<T extends BaseMessage>(T message) {
    _logger.i("Message $message published");
    _streamController.add(message);
  }

  @override
  StreamSubscription<T> subscribe<T extends BaseMessage>(
      FutureOr Function(T message) func) {
    _logger.i("Message $T subscribed");
    return _streamController.stream
        .where((event) => event is T)
        .map((event) => event as T)
        .listen(func);
  }
}
