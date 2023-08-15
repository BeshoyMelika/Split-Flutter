part of 'success_message_bloc.dart';

abstract class SuccessMessageEvent extends Equatable {}

class DoneEvent extends SuccessMessageEvent {
  @override
  List<Object?> get props => [];
}
