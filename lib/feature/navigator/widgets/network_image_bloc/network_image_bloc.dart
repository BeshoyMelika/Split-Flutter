import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'network_image_event.dart';
part 'network_image_state.dart';

class NetworkImageBloc extends Bloc<NetworkImageEvent, NetworkImageState> {
  NetworkImageBloc() : super(NetworkImageInitial()) {
    on<GetAccountImageEvent>(_onGetAccountPhoto);
    on<GetGroupImageEvent>(_onGetGroupImage);
  }

  //
  Future<void> _onGetAccountPhoto(
    GetAccountImageEvent event,
    Emitter<NetworkImageState> emit,
  ) async {
    emit(NetworkImageLoadingState());
    await Future.delayed(const Duration(seconds: 2));

    // this silly condition will be replaced with if the image exist or not from the api
    if (3 < 4) {
      emit(NetworkImageLoadedState());
    } else {
      emit(NetworkImageNotFoundState());
      // if it's not found i will add person icon
    }
  }

  Future<void> _onGetGroupImage(
    GetGroupImageEvent event,
    Emitter<NetworkImageState> emit,
  ) async {
    emit(NetworkImageLoadingState());
    await Future.delayed(const Duration(seconds: 2));

    // this silly condition will be replaced with if the image exist or not from the api
    if (3 < 4) {
      emit(NetworkImageLoadedState());
    } else {
      emit(NetworkImageNotFoundState());
      // if it's not found i will add person icon
    }
  }
}
