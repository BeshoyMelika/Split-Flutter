part of 'success_message_bloc.dart';

abstract class SuccessMessageState extends Equatable {}

class SuccessMessageInitial extends SuccessMessageState {
  @override
  List<Object?> get props => [];
}

class OpenLoginScreenSuccessState extends SuccessMessageState {
  @override
  List<Object?> get props => [];
}

class OpenLoginScreenFailureState extends SuccessMessageState {
  final String errMessage;

  OpenLoginScreenFailureState({required this.errMessage});
  @override
  List<Object?> get props => [errMessage];
}

class OpenLoginScreenLoadingState extends SuccessMessageState {
  @override
  List<Object?> get props => [];
}
