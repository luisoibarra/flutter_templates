import 'dart:async';

import 'messages/base_message.dart';

abstract class MessengerService {
  /// Publish messages across the app
  void publish<T extends BaseMessage>(T message);

  /// Subscribe to messages sended
  StreamSubscription<T> subscribe<T extends BaseMessage>(
      FutureOr Function(T message) func);
}
