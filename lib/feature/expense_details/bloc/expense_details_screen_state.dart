part of 'expense_details_screen_bloc.dart';

@immutable
abstract class ExpenseDetailsScreenState extends Equatable {}

class ExpenseDetailsScreenInitial extends ExpenseDetailsScreenState {
  @override
  List<Object?> get props => [];
}

class LoadedExpenseDetailsSuccessfullyState extends ExpenseDetailsScreenState {
  final ExpenseDetailsUIModel expenseDetails;

  LoadedExpenseDetailsSuccessfullyState({required this.expenseDetails});
  @override
  List<Object?> get props => [expenseDetails];
}

class ErrorHappenedWhileLoadingExpenseDetailsState
    extends ExpenseDetailsScreenState {
  final String errorMessage;

  ErrorHappenedWhileLoadingExpenseDetailsState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class WaitingExpenseDetailsScreenState extends ExpenseDetailsScreenState {
  @override
  List<Object?> get props => [];
}

class ReminderSentSuccessfullyExpenseDetailsState
    extends ExpenseDetailsScreenState {
  @override
  List<Object?> get props => [];
}

class ReceiptORPhotoAddedSuccessfullyExpenseDetailsState
    extends ExpenseDetailsScreenState {
  @override
  List<Object?> get props => [];
}
