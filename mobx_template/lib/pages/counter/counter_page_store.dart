import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'counter_page_param.dart';
import '../../services/counter/counter_service.dart';

part 'counter_page_store.g.dart';

@Injectable()
class CounterPageStore = _CounterPageStore with _$CounterPageStore;

abstract class _CounterPageStore with Store {
  final CounterService _counterService;

  _CounterPageStore(
    this._counterService,
  );

  void init(CounterPageParam? param) {
    if (param != null) {
      Future(() async {
        while (param.initialCounter > _counterService.counter) {
          increment();
          await Future.delayed(const Duration(milliseconds: 100));
        }
        while (param.initialCounter < _counterService.counter) {
          decrement();
          await Future.delayed(const Duration(milliseconds: 100));
        }
        _setValue(param.initialCounter);
      });
    }
  }

  @observable
  int value = 0;

  @action
  void _setValue(int value) {
    this.value = value;
  }

  @action
  void increment() {
    _counterService.increment();
    value = _counterService.counter;
  }

  @action
  void decrement() {
    _counterService.decrement();
    value = _counterService.counter;
  }
}
