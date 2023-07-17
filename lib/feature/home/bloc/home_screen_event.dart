part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenEvent extends Equatable {}

class ValidateFormFieldsEvent extends HomeScreenEvent {
  final GlobalKey<FormState> formKey;

  ValidateFormFieldsEvent({required this.formKey});
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class CreateNewGroupEvent extends HomeScreenEvent {
  final GroupSendUIModel newGroup;

  CreateNewGroupEvent({required this.newGroup});
  @override
  List<Object?> get props => [newGroup];
}
