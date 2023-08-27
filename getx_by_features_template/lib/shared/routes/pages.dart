import 'package:get/get.dart';

abstract class Pages {
  static final List<GetPage> pages = [];

  static void registerPages(List<GetPage> newPages) {
    pages.addAll(newPages);
  }
}
