part of 'on_boarding_screen_bloc.dart';

@immutable
abstract class OnBoardingScreenState extends Equatable {}

class OnBoardingWidgetInitial extends OnBoardingScreenState {
  @override
  List<Object?> get props => [];
}

class OnBoardingImagesListLoadedSuccessfullyState
    extends OnBoardingScreenState {
  final List<OnBoardingUIModel> onBoardingDataList;

  OnBoardingImagesListLoadedSuccessfullyState({
    required this.onBoardingDataList,
  });
  @override
  List<Object?> get props => [onBoardingDataList];
}

class LoadingDataOnBoardingState extends OnBoardingScreenState {
  @override
  List<Object?> get props => [];
}

class OpenHomeScreenState extends OnBoardingScreenState {
  @override
  List<Object?> get props => [];
}
