import 'di/dependency_injection.dart';
import 'lang/messages.dart';
import 'lang/translations/languages/en.dart';
import 'lang/translations/languages/es.dart';

void setupShared() {
  Messages.registerMessages(English.messages, Spanish.messages);
  configureDependencies();
}
