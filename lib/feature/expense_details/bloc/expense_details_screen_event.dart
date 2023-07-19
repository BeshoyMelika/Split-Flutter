part of 'expense_details_screen_bloc.dart';

@immutable
abstract class ExpenseDetailsScreenEvent extends Equatable {}

class GetExpenseDetailsAPIEvent extends ExpenseDetailsScreenEvent {
  @override
  List<Object?> get props => [];
}

class SendReminderAPIEvent extends ExpenseDetailsScreenEvent {
  @override
  List<Object?> get props => [];
}

class UploadPhotoAPIEvent extends ExpenseDetailsScreenEvent {
  final String? imagePath;

  UploadPhotoAPIEvent({required this.imagePath});
  @override
  List<Object?> get props => [imagePath];
}
