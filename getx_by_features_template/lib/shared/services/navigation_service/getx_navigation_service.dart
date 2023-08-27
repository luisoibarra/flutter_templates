import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'navigation_service.dart';

@LazySingleton(as: NavigationService)
class GetxNavigationService implements NavigationService {
  @override
  Future<T?>? toNamed<T>(String page, {dynamic arguments}) {
    return Get.toNamed<T>(page, arguments: arguments);
  }

  @override
  Future<T?>? offNamed<T>(String page, {dynamic arguments}) {
    return Get.offNamed<T>(page, arguments: arguments);
  }

  @override
  void back<T>([T? result]) {
    Get.back<T>(result: result);
  }

  @override
  void backUntil<T>(String destinyPage) {
    while (Get.currentRoute != destinyPage) {
      Get.back();
    }
  }

  @override
  Future<T?>? offAllNamed<T>(String page) async {
    return Get.offAllNamed(page);
  }

  @override
  void buildRoute(List<String> routes,
      {String? defaultIfEmpty, Map<String, dynamic>? routeArgs}) {
    routeArgs ??= <String, dynamic>{};

    if (routes.isEmpty && defaultIfEmpty != null) {
      // Default behavior
      Get.offNamed(defaultIfEmpty, arguments: routeArgs[defaultIfEmpty]);
    } else {
      // Navigate off and to first page
      Get.offNamed(routes.first, arguments: routeArgs[routes.first]);
    }

    for (var currentRoute in routes.skip(1)) {
      // Build the rest of the navigation stack
      Get.toNamed(currentRoute, arguments: routeArgs[currentRoute]);
    }
  }

  @override
  Future<T?>? backUntilAndToNamed<T>(String page, String destinyPage,
      {dynamic arguments}) {
    backUntil(destinyPage);
    return toNamed(page, arguments: arguments);
  }

  @override
  void closeDialog() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  @override
  void showSimpleDialog(String title, String text) {
    Get.defaultDialog(title: title, middleText: text);
  }

  @override
  void showSimpleSnackbarDialog(String title, String text) {
    Get.snackbar(title, text);
  }
}
