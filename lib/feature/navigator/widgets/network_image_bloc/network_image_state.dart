// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'network_image_bloc.dart';

abstract class NetworkImageState extends Equatable {
  const NetworkImageState();

  @override
  List<Object> get props => [];
}

class NetworkImageInitial extends NetworkImageState {}

class NetworkImageLoadingState extends NetworkImageState {
  @override
  List<Object> get props => [];
}

class NetworkImageFiledState extends NetworkImageState {
  final String errorMsg;
  const NetworkImageFiledState({
    required this.errorMsg,
  });
}

class NetworkImageLoadedState extends NetworkImageState {
  @override
  List<Object> get props => [];
}

class NetworkImageNotFoundState extends NetworkImageState {
  @override
  List<Object> get props => [];
}
