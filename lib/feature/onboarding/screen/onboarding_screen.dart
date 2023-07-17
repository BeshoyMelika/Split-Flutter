import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/create_group/screen/create_group_screen.dart';
import 'package:split/feature/create_group/widget/create_group_elevated_button_custom.dart';
import 'package:split/feature/onboarding/bloc/on_boarding_screen_bloc.dart';
import 'package:split/feature/onboarding/models/onboarding_ui_model.dart';
import 'package:split/feature/onboarding/widgets/onboarding_item_widget.dart';
import 'package:split/res/app_asset_paths.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OnBoardingScreenBloc()..add(LoadOnBoardingData()),
        child: const OnBoardingScreenWithBloc());
  }
}

class OnBoardingScreenWithBloc extends BaseStatefulScreenWidget {
  const OnBoardingScreenWithBloc({Key? key}) : super(key: key);

  @override
  BaseScreenState<OnBoardingScreenWithBloc> baseScreenCreateState() =>
      _OnBoardingScreenWithBloc();
}

class _OnBoardingScreenWithBloc
    extends BaseScreenState<OnBoardingScreenWithBloc> {
  final PageController _pageController = PageController(initialPage: 0);
  List<OnBoardingUIModel> onBoardingDataList = [];
  bool dataHasBeenLoaded = false;
  @override
  Widget baseScreenBuild(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.onBoardingScreenScaffoldBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssetPaths.shapes),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocConsumer<OnBoardingScreenBloc, OnBoardingScreenState>(
            listener: (context, state) {
              if (state is OnBoardingImagesListLoadedSuccessfullyState) {
                hideLoading();
                onBoardingDataList = state.onBoardingDataList;
                dataHasBeenLoaded = true;
              } else if (state is LoadingDataOnBoardingState) {
                showLoading();
              } else if (state is OpenHomeScreenState) {
                _navigateToHomeScreen();
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  dataHasBeenLoaded
                      ? PageView.builder(
                          controller: _pageController,
                          itemCount: onBoardingDataList.length,
                          itemBuilder: (context, index) => OnBoardingItemWidget(
                              mainText: translate(
                                  onBoardingDataList[index].mainText)!,
                              subText:
                                  translate(onBoardingDataList[index].subText)!,
                              imagePath: onBoardingDataList[index].imageURL))
                      : const SizedBox.shrink(),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 60,
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: onBoardingDataList.length,
                        effect: const ExpandingDotsEffect(
                          activeDotColor:
                              AppColors.onBoardingScreenIndicatorDots,
                          dotHeight: 10,
                          dotWidth: 10,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: CreateGroupElevatedButtonCustom(
                          text: translate(LocalizationKeys.getStarted)!,
                          onPressed: () {
                            _onGetStartedTap();
                          },
                          buttonHeight: 50.h,
                          alignment: AlignmentDirectional.center),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    ));
  }

  /// /////////////////////////////////////////////////////////////
  /// //////////////////Helper Methods/////////////////////////////
  /// /////////////////////////////////////////////////////////////
  void _onGetStartedTap() {
    BlocProvider.of<OnBoardingScreenBloc>(context).add(NavigateToHomePage());
  }

  void _navigateToHomeScreen() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const CreateGroupScreen()),
        (route) => false);
  }
}
