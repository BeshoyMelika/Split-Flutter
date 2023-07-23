part of 'network_image_bloc.dart';

abstract class NetworkImageEvent extends Equatable {
  const NetworkImageEvent();
}

class GetAccountImageEvent extends NetworkImageEvent {
  @override
  List<Object?> get props => [];
}

class GetGroupImageEvent extends NetworkImageEvent {
  @override
  List<Object?> get props => [];
}
