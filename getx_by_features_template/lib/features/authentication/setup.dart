import '../../shared/lang/messages.dart';
import '../../shared/routes/pages.dart';
import 'di/dependency_injection.dart';
import 'lang/languages/en.dart';
import 'lang/languages/es.dart';
import 'routes/pages.dart';

void setupAuthentication() {
  Messages.registerMessages(
      AuthenticationEnglish.messages, AuthenticationSpanish.messages);
  Pages.registerPages(AuthenticationPages.pages);
  authenticationConfigureDependencies();
}
