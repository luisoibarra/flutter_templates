import '../../shared/lang/messages.dart';
import '../../shared/routes/pages.dart';
import 'di/dependency_injection.dart';
import 'lang/languages/en.dart';
import 'lang/languages/es.dart';
import 'routes/pages.dart';

void setupHome() {
  Messages.registerMessages(HomeEnglish.messages, HomeSpanish.messages);
  Pages.registerPages(HomePages.pages);
  authenticationConfigureDependencies();
}
