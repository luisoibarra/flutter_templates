import 'package:injectable/injectable.dart';

import '../../lang/lang_service.dart';
import '../../lang/translations/translation_keys.dart';
import '../navigation_service/navigation_service.dart';
import 'error_notifier_service.dart';

@LazySingleton(as: ErrorNotifierService)
class BasicErrorNotifierService implements ErrorNotifierService {
  final NavigationService _navigation;

  BasicErrorNotifierService(this._navigation);

  @override
  void notifyError(String error, {ShowError by = ShowError.userDialog}) {
    switch (by) {
      case ShowError.userDialog:
        _navigation.showSimpleDialog(
            LanguageService.translate(TranslationKeys.error), error);
        break;
      case ShowError.snackbarDialog:
        _navigation.showSimpleDialog(
            LanguageService.translate(TranslationKeys.error), error);
        break;
    }
  }
}
