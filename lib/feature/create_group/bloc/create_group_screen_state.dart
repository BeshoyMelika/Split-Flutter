part of 'create_group_screen_bloc.dart';

@immutable
abstract class CreateGroupScreenState extends Equatable {}

class CreateGroupScreenInitial extends CreateGroupScreenState {
  @override
  List<Object?> get props => [];
}

class LoadingCreateGroupScreenState extends CreateGroupScreenState {
  @override
  List<Object?> get props => [];
}

class ErrorCaughtCreateGroupScreenState extends CreateGroupScreenState {
  final String errorMessage;

  ErrorCaughtCreateGroupScreenState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class ValidationDoneSuccessfullyCreateGroupScreenState
    extends CreateGroupScreenState {
  @override
  List<Object?> get props => [];
}

class NotValidCreateGroupScreenState extends CreateGroupScreenState {
  @override
  List<Object?> get props => [];
}

class NewGroupCreatedSuccessfullyState extends CreateGroupScreenState {
  @override
  List<Object?> get props => [];
}
