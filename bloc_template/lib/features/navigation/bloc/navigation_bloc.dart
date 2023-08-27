import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';
part 'navigation_bloc.freezed.dart';

@singleton
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final GoRouter router;

  NavigationBloc(this.router) : super(const NavigationState(currentRoute: "")) {
    on<NavigationEvent>((event, emit) {
      router.go(event.route, extra: event.param);
    });
  }
}
