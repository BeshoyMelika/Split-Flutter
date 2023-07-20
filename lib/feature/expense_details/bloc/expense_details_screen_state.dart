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

class ErrorState extends ExpenseDetailsScreenState {
  final String errorMessage;
  ErrorState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class LoadingState extends ExpenseDetailsScreenState {
  @override
  List<Object?> get props => [];
}

class ReminderSentSuccessfullyState extends ExpenseDetailsScreenState {
  @override
  List<Object?> get props => [];
}

class PhotoUploadedSuccessfullyState extends ExpenseDetailsScreenState {
  @override
  List<Object?> get props => [];
}

class AppBarSwitcherState extends ExpenseDetailsScreenState {
  final bool lastState;
  AppBarSwitcherState({required this.lastState});
  @override
  List<Object?> get props => [identityHashCode(this)];
}
