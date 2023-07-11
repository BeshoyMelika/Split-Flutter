import 'package:bloc/bloc.dart';
import 'package:split/feature/navigator/navigator_bloc/navigator_event.dart';
import 'package:split/feature/navigator/navigator_bloc/navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, NavigatorBlocSates> {
  NavigatorBloc() : super(const NavigatorInitialState()) {
    //
    on<NavigateToGroupScreenEvent>(_navigateToGroupScreenFired);
    //
    on<NavigateToActivityScreenEvent>(_navigateToActivityScreenFired);
    //
    on<NavigateToFriendsScreenEvent>(_navigateToFriendsScreenFired);
    //
    on<NavigateToProfileScreenEvent>(_navigateToProfileScreenFired);
  }

  void _navigateToGroupScreenFired(
      NavigateToGroupScreenEvent event, Emitter<NavigatorBlocSates> emit) {
    emit(const NavigateToGroupScreenState());
  }

  void _navigateToActivityScreenFired(
      NavigateToActivityScreenEvent event, Emitter<NavigatorBlocSates> emit) {
    emit(const NavigateToActivityScreenState());
  }

  void _navigateToFriendsScreenFired(
      NavigateToFriendsScreenEvent event, Emitter<NavigatorBlocSates> emit) {
    emit(const NavigateToFriendsScreenState());
  }

  void _navigateToProfileScreenFired(
      NavigateToProfileScreenEvent event, Emitter<NavigatorBlocSates> emit) {
    emit(const NavigateToProfileScreenState());
  }
}
