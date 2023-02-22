abstract class NavigationService {
  Future<T?>? toNamed<T>(String page, {dynamic arguments});
  Future<T?>? offNamed<T>(String page, {dynamic arguments});
  Future<T?>? backUntilAndToNamed<T>(String selectRole, String home,
      {dynamic arguments});
  void back<T>([T? result]);
  void backUntil<T>(String destinyPage);
  void buildRoute(List<String> routes,
      {String? defaultIfEmpty, Map<String, dynamic>? routeArgs});
  void closeDialog();
}
