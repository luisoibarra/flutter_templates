part of 'navigation_bloc.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState({
    required String currentRoute,
  }) = _NavigationState;
}
