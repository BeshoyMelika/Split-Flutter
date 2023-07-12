part of 'on_boarding_screen_bloc.dart';

@immutable
abstract class OnBoardingScreenState extends Equatable {}

class OnBoardingWidgetInitial extends OnBoardingScreenState {
  @override
  List<Object?> get props => [];
}

class OnBoardingImagesListLoadedSuccessfullyState
    extends OnBoardingScreenState {
  final List<String> imagesURLs;
  final List<String> mainTexts;
  final List<String> subTexts;

  OnBoardingImagesListLoadedSuccessfullyState(
      {required this.imagesURLs,
      required this.mainTexts,
      required this.subTexts});
  @override
  List<Object?> get props => [imagesURLs, mainTexts, subTexts];
}

class LoadingDataOnBoardingState extends OnBoardingScreenState {
  @override
  List<Object?> get props => [];
}
