part of 'set_account_bloc.dart';

abstract class SetAccountState extends Equatable {}

class SetAccountInitial extends SetAccountState {
  @override
  List<Object?> get props => [];
}

class SubmitSetAccountSuccessState extends SetAccountState {
  @override
  List<Object?> get props => [];
}

class SubmitSetAccountLoadingState extends SetAccountState {
  @override
  List<Object?> get props => [];
}

class SubmitSetAccountFailureState extends SetAccountState {
  final String errMessage;

  SubmitSetAccountFailureState({required this.errMessage});
  @override
  List<Object?> get props => [errMessage];
}

class ValidateSetAccountState extends SetAccountState {
  @override
  List<Object?> get props => [];
}

class NotValidateSetAccountState extends SetAccountState {
  @override
  List<Object?> get props => [];
}
