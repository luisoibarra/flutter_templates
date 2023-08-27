import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';
part 'counter_bloc.freezed.dart';

@Injectable()
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc({@factoryParam int counter = 0})
      : super(CounterState(counter: counter)) {
    on<IncreaseCounterEvent>((event, emit) {
      // Increase value
      emit(CounterState(counter: state.counter + 1));
    });
    on<DecreaseCounterEvent>((event, emit) {
      // Decrease value
      emit(CounterState(counter: state.counter - 1));
    });
  }
}
