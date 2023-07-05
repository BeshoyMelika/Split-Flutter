import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/home/screen/home_screen.dart';
import 'package:split/feature/home/widget/home_elevated_button_custom.dart';
import 'package:split/feature/onboarding/widgets/page_view_custom.dart';
import 'package:split/res/app_asset_paths.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

class OnBoardingScreen extends BaseStatefulScreenWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  BaseScreenState<OnBoardingScreen> baseScreenCreateState() =>
      _OnBoardingScreenState();
}

class _OnBoardingScreenState extends BaseScreenState<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget baseScreenBuild(BuildContext context) {
    final pages = [
      PageViewCustom(
          mainText:
              translate(LocalizationKeys.calculateAllOfYourExpensesInOnePlace)!,
          subText: translate(
              LocalizationKeys.aPlatFormToManageYourFinancesWithAnyoneEasily)!,
          imagePath: AppAssetPaths.approveIcon),
      PageViewCustom(
          mainText:
              translate(LocalizationKeys.calculateAllOfYourExpensesInOnePlace)!,
          subText: translate(
              LocalizationKeys.aPlatFormToManageYourFinancesWithAnyoneEasily)!,
          imagePath: AppAssetPaths.approveIcon),
      PageViewCustom(
          mainText:
              translate(LocalizationKeys.calculateAllOfYourExpensesInOnePlace)!,
          subText: translate(
              LocalizationKeys.aPlatFormToManageYourFinancesWithAnyoneEasily)!,
          imagePath: AppAssetPaths.approveIcon),
    ];
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
          child: Column(
            children: [
              SizedBox(height: 26.h),
              Expanded(
                child: SizedBox(
                    height: 380.h,
                    child: PageView(
                      controller: _pageController,
                      children: pages,
                    )),
              ),
              SizedBox(height: 80.h),
              SmoothPageIndicator(
                controller: _pageController,
                count: pages.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: AppColors.onBoardingScreenIndicatorDots,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
              SizedBox(height: 80.h),
              HomeElevatedButtonCustom(
                  text: translate(LocalizationKeys.getStarted)!,
                  onPressed: () {
                    _onGetStartedTap();
                  },
                  buttonHeight: 50.h,
                  alignment: AlignmentDirectional.center)
            ],
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
