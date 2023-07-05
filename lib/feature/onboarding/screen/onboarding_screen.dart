import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/onboarding/widgets/page_view_custom.dart';
import 'package:split/res/app_asset_paths.dart';
import 'package:split/res/app_colors.dart';

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
      PageViewCustom(text: "text1", imagePath: AppAssetPaths.approveIcon),
      PageViewCustom(text: "text2", imagePath: AppAssetPaths.approveIcon),
      PageViewCustom(text: "text3", imagePath: AppAssetPaths.approveIcon),
    ];
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.onBoardingScreenScaffoldBackground,
      body: SizedBox(
        height: 650.h,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
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
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
