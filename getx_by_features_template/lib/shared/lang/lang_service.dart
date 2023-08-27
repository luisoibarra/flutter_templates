import 'package:get/get.dart';

abstract class LanguageService {
  static String translate(String key, [Map<String, String> params = const {}]) {
    return key.trParams(params);
  }
}
