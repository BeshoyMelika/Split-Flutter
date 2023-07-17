import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:split/feature/onboarding/models/onboarding_ui_model.dart';
import 'package:split/utils/locale/app_localization_keys.dart';
part 'on_boarding_screen_event.dart';
part 'on_boarding_screen_state.dart';

class OnBoardingScreenBloc
    extends Bloc<OnBoardingScreenEvent, OnBoardingScreenState> {
  static const networkImageHold =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4CtaDk3U49ukzwQTk5h6n1mwtWT9HULw-piOF2eF4&s";

  final List<OnBoardingUIModel> onBoardingDataList = [
    OnBoardingUIModel(
        imageURL: networkImageHold,
        mainText: LocalizationKeys.calculateAllOfYourExpensesInOnePlace,
        subText:
            LocalizationKeys.aPlatFormToManageYourFinancesWithAnyoneEasily),
    OnBoardingUIModel(
        imageURL: networkImageHold,
        mainText: LocalizationKeys.calculateAllOfYourExpensesInOnePlace,
        subText:
            LocalizationKeys.aPlatFormToManageYourFinancesWithAnyoneEasily),
    OnBoardingUIModel(
        imageURL: networkImageHold,
        mainText: LocalizationKeys.calculateAllOfYourExpensesInOnePlace,
        subText:
            LocalizationKeys.aPlatFormToManageYourFinancesWithAnyoneEasily),
  ];
  OnBoardingScreenBloc() : super(OnBoardingWidgetInitial()) {
    on<LoadOnBoardingData>(_loadOnBoardingData);
    on<NavigateToHomePage>(_navigateToHomePage);
  }

  FutureOr<void> _loadOnBoardingData(
      LoadOnBoardingData event, Emitter<OnBoardingScreenState> emit) async {
    emit(LoadingDataOnBoardingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(OnBoardingImagesListLoadedSuccessfullyState(
        onBoardingDataList: onBoardingDataList));
  }

  FutureOr<void> _navigateToHomePage(
      NavigateToHomePage event, Emitter<OnBoardingScreenState> emit) {
    emit(OpenHomeScreenState());
  }
}
