part of 'navigation_bloc.dart';

@freezed
class NavigationEvent with _$NavigationEvent {
  const factory NavigationEvent.navigateTo(
      {required String route, Object? param}) = _NavigationEvent;
}
