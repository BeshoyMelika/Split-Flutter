import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'account_photo_event.dart';
part 'account_photo_state.dart';

class AccountPhotoBloc extends Bloc<AccountPhotoEvent, AccountPhotoState> {
  AccountPhotoBloc() : super(AccountPhotoInitial()) {
    on<GetAccountPhoto>(_onGetAccountPhoto);
  }

  //
  Future<void> _onGetAccountPhoto(
    GetAccountPhoto event,
    Emitter<AccountPhotoState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(AccountPhotoLoadingState());
    // this silly condition will be replaced with if the image exist or not from the api
    if (3 < 4) {
      emit(AccountPhotoLoadedState());
    }
  }
}
