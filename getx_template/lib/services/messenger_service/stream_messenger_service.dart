import 'dart:async';

import 'package:get/get.dart';
import '../logger_service/logger_service.dart';
import 'messages/base_message.dart';
import 'messenger_service.dart';

class StreamMessengerService extends GetxService implements MessengerService {
  late final StreamController _streamController;
  final _logger = Get.find<LoggerService>();

  StreamMessengerService() {
    _streamController =
        StreamController.broadcast(onListen: _onListen, onCancel: _onCancel);
  }

  /// Called when stream gets the firts subscribers
  void _onListen() {}

  /// Called when the lasts subscribers unsubscribe from stream
  void _onCancel() {}

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
