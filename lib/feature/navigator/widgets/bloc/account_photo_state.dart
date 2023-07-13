part of 'account_photo_bloc.dart';

abstract class AccountPhotoState extends Equatable {
  const AccountPhotoState();

  @override
  List<Object> get props => [];
}

class AccountPhotoInitial extends AccountPhotoState {}

class AccountPhotoLoadingState extends AccountPhotoState {}

class AccountPhotoFiledState extends AccountPhotoState {}

class AccountPhotoLoadedState extends AccountPhotoState {}

class AccountPhotoNotFoundState extends AccountPhotoState {}
