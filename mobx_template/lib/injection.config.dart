// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'pages/counter/counter_page_store.dart' as _i8;
import 'pages/home/home_page_store.dart' as _i5;
import 'services/counter/counter_service.dart' as _i3;
import 'services/counter/simple_counter_service.dart' as _i4;
import 'services/logger/basic_logger_service.dart' as _i7;
import 'services/logger/logger_service.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.CounterService>(_i4.SimpleCounterService());
    gh.factory<_i5.HomePageStore>(() => _i5.HomePageStore());
    gh.singleton<_i6.LoggerService>(_i7.BasicLoggerService());
    gh.factory<_i8.CounterPageStore>(
        () => _i8.CounterPageStore(gh<_i3.CounterService>()));
    return this;
  }
}
