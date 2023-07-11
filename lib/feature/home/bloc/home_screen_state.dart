part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenState extends Equatable {}

class HomeScreenInitial extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class WaitingHomeScreenState extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class ErrorCaughtHomeScreenState extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class ValidationDoneSuccessfullyHomeScreenState extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class UnValidHomeScreenState extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class NewGroupCreatedSuccessfullyState extends HomeScreenState {
  @override
  List<Object?> get props => [];
}
