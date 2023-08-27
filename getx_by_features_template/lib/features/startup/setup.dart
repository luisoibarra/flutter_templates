import '../../shared/lang/messages.dart';
import '../../shared/routes/pages.dart';
import 'di/dependency_injection.dart';
import 'lang/languages/en.dart';
import 'lang/languages/es.dart';
import 'routes/pages.dart';

void setupStartup() {
  Messages.registerMessages(StartupEnglish.messages, StartupSpanish.messages);
  Pages.registerPages(StartupPages.pages);
  startupConfigureDependencies();
}
