part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenState extends Equatable {}

class HomeScreenInitial extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class LoadingHomeScreenState extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class ErrorCaughtHomeScreenState extends HomeScreenState {
  final String errorMessage;

  ErrorCaughtHomeScreenState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class ValidationDoneSuccessfullyHomeScreenState extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class NotValidHomeScreenState extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class NewGroupCreatedSuccessfullyState extends HomeScreenState {
  @override
  List<Object?> get props => [];
}
