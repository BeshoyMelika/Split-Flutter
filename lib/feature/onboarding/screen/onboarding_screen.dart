import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/home/screen/home_screen.dart';
import 'package:split/feature/home/widget/home_elevated_button_custom.dart';
import 'package:split/feature/onboarding/bloc/on_boarding_screen_bloc.dart';
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
  List<String> images = [LocalizationKeys.account];
  List<String> onBoardingItemsMainTexts = [LocalizationKeys.account];
  List<String> onBoardingItemsSubTexts = [LocalizationKeys.account];
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
                images = state.imagesURLs;
                onBoardingItemsMainTexts = state.mainTexts;
                onBoardingItemsSubTexts = state.subTexts;
                dataHasBeenLoaded = true;
              } else if (state is LoadingDataOnBoardingState) {
                showLoading();
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    children: [
                      dataHasBeenLoaded
                          ? OnBoardingItemWidget(
                              mainText: translate(onBoardingItemsMainTexts[
                                  OnBoardingItemWidgetIndex.firstPage.index])!,
                              subText: translate(onBoardingItemsSubTexts[
                                  OnBoardingItemWidgetIndex.firstPage.index])!,
                              imagePath: images[
                                  OnBoardingItemWidgetIndex.firstPage.index])
                          : const SizedBox.shrink(),
                      dataHasBeenLoaded
                          ? OnBoardingItemWidget(
                              mainText: translate(onBoardingItemsMainTexts[
                                  OnBoardingItemWidgetIndex.secondPage.index])!,
                              subText: translate(onBoardingItemsSubTexts[
                                  OnBoardingItemWidgetIndex.secondPage.index])!,
                              imagePath: images[
                                  OnBoardingItemWidgetIndex.secondPage.index])
                          : const SizedBox.shrink(),
                      dataHasBeenLoaded
                          ? OnBoardingItemWidget(
                              mainText: translate(onBoardingItemsMainTexts[
                                  OnBoardingItemWidgetIndex.thirdPage.index])!,
                              subText: translate(onBoardingItemsSubTexts[
                                  OnBoardingItemWidgetIndex.thirdPage.index])!,
                              imagePath: images[
                                  OnBoardingItemWidgetIndex.thirdPage.index])
                          : const SizedBox.shrink(),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 60,
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
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
                      child: HomeElevatedButtonCustom(
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
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false);
  }
}
