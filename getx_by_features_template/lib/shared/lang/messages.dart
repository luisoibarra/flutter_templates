import 'package:get/get.dart';

class Messages extends Translations {
  static final Map<String, String> _allEnglishMessages = {};
  static final Map<String, String> _allSpanishMessages = {};

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': _allEnglishMessages,
        'es_ES': _allSpanishMessages,
      };

  static void registerMessages(
      Map<String, String> english, Map<String, String> spanish) {
    _allEnglishMessages.addAll(english);
    _allSpanishMessages.addAll(spanish);
  }
}
