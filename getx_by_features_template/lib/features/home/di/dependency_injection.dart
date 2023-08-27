import 'package:injectable/injectable.dart';
import '../../../shared/di/dependency_injection.dart';
import 'dependency_injection.config.dart';

@InjectableInit(generateForDir: ['lib/features/home'])
void authenticationConfigureDependencies() {
  locator.init();
}
