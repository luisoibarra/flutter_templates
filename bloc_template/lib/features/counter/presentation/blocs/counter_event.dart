part of 'counter_bloc.dart';

@freezed
class CounterEvent with _$CounterEvent {
  factory CounterEvent.increment() = IncreaseCounterEvent;
  factory CounterEvent.decrement() = DecreaseCounterEvent;
}
