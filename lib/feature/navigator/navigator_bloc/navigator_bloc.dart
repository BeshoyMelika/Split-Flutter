import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/feature/navigator/navigator_bloc/navigator_event.dart';
import 'package:split/feature/navigator/navigator_bloc/navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, NavigatorBlocSates> {
  NavigatorBloc() : super(const NavigatorInitialState()) {
    on<MakeGroupsTheCurrentScreenEvent>(_navigateToGroupScreenFired);
    on<MakeActivityTheCurrentScreenEvent>(_navigateToActivityScreenFired);
    on<MakeFriendsTheCurrentScreenEvent>(_navigateToFriendsScreenFired);
    on<MakeProfileTheCurrentScreenEvent>(_navigateToProfileScreenFired);
  }

  void _navigateToGroupScreenFired(
      MakeGroupsTheCurrentScreenEvent event, Emitter<NavigatorBlocSates> emit) {
    emit(const NavigateToGroupScreenState());
  }

  void _navigateToActivityScreenFired(MakeActivityTheCurrentScreenEvent event,
      Emitter<NavigatorBlocSates> emit) {
    emit(const NavigateToActivityScreenState());
  }

  void _navigateToFriendsScreenFired(MakeFriendsTheCurrentScreenEvent event,
      Emitter<NavigatorBlocSates> emit) {
    emit(const NavigateToFriendsScreenState());
  }

  void _navigateToProfileScreenFired(MakeProfileTheCurrentScreenEvent event,
      Emitter<NavigatorBlocSates> emit) {
    emit(const NavigateToProfileScreenState());
  }
}
