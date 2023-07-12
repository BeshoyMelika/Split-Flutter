part of 'on_boarding_screen_bloc.dart';

@immutable
abstract class OnBoardingScreenEvent extends Equatable {}

class LoadOnBoardingData extends OnBoardingScreenEvent {
  @override
  List<Object?> get props => [];
}

class NavigateToHomePage extends OnBoardingScreenEvent {
  @override
  List<Object?> get props => [];
}
