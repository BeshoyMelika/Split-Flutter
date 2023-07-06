part of 'reset_password_bloc.dart';

@immutable
abstract class ResetPasswordEvent {}

class SubmitPasswordEvent extends ResetPasswordEvent {}
