part of 'success_message_bloc.dart';

abstract class SuccessMessageState {}

class SuccessMessageInitial extends SuccessMessageState {}

class DoneSuccessState extends SuccessMessageState {}

class DoneFailureState extends SuccessMessageState {}

class DoneLoadingState extends SuccessMessageState {}
