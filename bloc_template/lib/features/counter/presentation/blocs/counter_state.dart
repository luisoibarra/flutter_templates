part of 'counter_bloc.dart';

@freezed
abstract class CounterState with _$CounterState {
  factory CounterState({
    required int counter,
  }) = _CounterState;

  factory CounterState.initial() {
    return CounterState(counter: 0);
  }
}
