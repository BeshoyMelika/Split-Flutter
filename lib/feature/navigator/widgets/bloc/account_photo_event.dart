part of 'account_photo_bloc.dart';

abstract class AccountPhotoEvent extends Equatable {
  const AccountPhotoEvent();

  @override
  List<Object> get props => [];
}

class GetAccountPhoto extends AccountPhotoEvent {}
