import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState(initialInput: "")) {
    on<HomeEvent>((event, emit) {
      if (event is _InputNumberChanged) {
        emit(state.copyWith(initialInput: event.input));
      }
    });
  }
}
