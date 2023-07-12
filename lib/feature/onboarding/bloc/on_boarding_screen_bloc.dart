import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:split/utils/locale/app_localization_keys.dart';
part 'on_boarding_screen_event.dart';
part 'on_boarding_screen_state.dart';

class OnBoardingScreenBloc
    extends Bloc<OnBoardingScreenEvent, OnBoardingScreenState> {
  static const networkImageHold =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4CtaDk3U49ukzwQTk5h6n1mwtWT9HULw-piOF2eF4&s";
  final List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4CtaDk3U49ukzwQTk5h6n1mwtWT9HULw-piOF2eF4&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4CtaDk3U49ukzwQTk5h6n1mwtWT9HULw-piOF2eF4&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4CtaDk3U49ukzwQTk5h6n1mwtWT9HULw-piOF2eF4&s"
  ];
  final List<String> onBoardingItemsMainTexts = [
    LocalizationKeys.calculateAllOfYourExpensesInOnePlace,
    LocalizationKeys.calculateAllOfYourExpensesInOnePlace,
    LocalizationKeys.calculateAllOfYourExpensesInOnePlace
  ];
  final List<String> onBoardingItemsSubTexts = [
    LocalizationKeys.aPlatFormToManageYourFinancesWithAnyoneEasily,
    LocalizationKeys.aPlatFormToManageYourFinancesWithAnyoneEasily,
    LocalizationKeys.aPlatFormToManageYourFinancesWithAnyoneEasily
  ];

  OnBoardingScreenBloc() : super(OnBoardingWidgetInitial()) {
    on<LoadOnBoardingData>(_loadOnBoardingData);
  }

  FutureOr<void> _loadOnBoardingData(
      LoadOnBoardingData event, Emitter<OnBoardingScreenState> emit) async {
    emit(LoadingDataOnBoardingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(OnBoardingImagesListLoadedSuccessfullyState(
        imagesURLs: images,
        mainTexts: onBoardingItemsMainTexts,
        subTexts: onBoardingItemsSubTexts));
  }
}
