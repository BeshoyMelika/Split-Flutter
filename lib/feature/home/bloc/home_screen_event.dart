part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenEvent extends Equatable {}

class ValidateFormFieldsEvent extends HomeScreenEvent {
  final GlobalKey<FormState> globalKey;

  ValidateFormFieldsEvent({required this.globalKey});
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class CreateNewGroupEvent extends HomeScreenEvent {
  final GroupModel newGroup;

  CreateNewGroupEvent({required this.newGroup});
  @override
  List<Object?> get props => [];
}
