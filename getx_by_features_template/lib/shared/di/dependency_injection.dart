import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/dio_service/dio_service.dart';
import 'dependency_injection.config.dart';

final locator = GetIt.instance;

@InjectableInit(generateForDir: ['lib/shared'])
configureDependencies() {
  locator.init();
  locator.registerLazySingleton<Dio>(() {
    final dio = Dio();
    DioService.configureDio(dio);
    return dio;
  });
  locator.registerSingletonAsync(() => SharedPreferences.getInstance());
}
