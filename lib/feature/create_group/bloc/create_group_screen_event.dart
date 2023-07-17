part of 'create_group_screen_bloc.dart';

@immutable
abstract class CreateGroupScreenEvent extends Equatable {}

class ValidateFormFieldsEvent extends CreateGroupScreenEvent {
  final GlobalKey<FormState> formKey;

  ValidateFormFieldsEvent({required this.formKey});
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class CreateNewGroupEvent extends CreateGroupScreenEvent {
  final GroupSendUIModel newGroup;

  CreateNewGroupEvent({required this.newGroup});
  @override
  List<Object?> get props => [newGroup];
}
