part of 'expense_details_screen_bloc.dart';

@immutable
abstract class ExpenseDetailsScreenEvent extends Equatable {}

class LoadExpenseDetailsEvent extends ExpenseDetailsScreenEvent {
  @override
  List<Object?> get props => [];
}

class SendReminderToAllUsersExpenseDetailsEvent
    extends ExpenseDetailsScreenEvent {
  @override
  List<Object?> get props => [];
}

class AddPhotoOrReceiptForExpenseDetailsEvent
    extends ExpenseDetailsScreenEvent {
  @override
  List<Object?> get props => [];
}
