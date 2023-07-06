part of 'congrats_bloc.dart';

abstract class CongratsState {}

class CongratsInitial extends CongratsState {}

class DoneSuccessState extends CongratsState {}

class DoneFailureState extends CongratsState {}

class DoneLoadingState extends CongratsState {}
