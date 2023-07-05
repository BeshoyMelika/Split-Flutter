import 'package:bloc/bloc.dart';
import 'package:split/feature/navigator/navigator_bloc/navigator_event.dart';
import 'package:split/feature/navigator/navigator_bloc/navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, NavigatorStates> {
  NavigatorBloc() : super(const NavigatorInitialState(tabIndex: 0)) {
    on<NavigatorEvent>((event, emit) {
      if (event is TabChange) {
        emit(NavigatorInitialState(tabIndex: event.tabIndex));
      }
    });
  }
}
