import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/auth/widgets/social_button.dart';
import 'package:split/res/app_asset_paths.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

// ignore: must_be_immutable
class SocialMediaLoginAndSignUpWidget extends BaseStatelessWidget {
  SocialMediaLoginAndSignUpWidget(
      {super.key,
      required this.textORLocalizationKey,
      required this.googleOnPressed,
      required this.appleOnPressed});
  final String textORLocalizationKey;
  final void Function()? googleOnPressed;
  final void Function()? appleOnPressed;
  @override
  Widget baseBuild(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Container(
              color: AppColors.divider,
              height: 1,
            )),
            SizedBox(width: 5.w),
            Text(translate(textORLocalizationKey)!,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )),
            SizedBox(width: 5.w),
            Expanded(
                child: Container(
              color: AppColors.divider,
              height: 1,
            )),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: SocialButton(
                onPressed: googleOnPressed,
                title: translate(LocalizationKeys.google)!,
                image: AppAssetPaths.googleLogo,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: SocialButton(
                onPressed: appleOnPressed,
                title: translate(LocalizationKeys.apple)!,
                image: AppAssetPaths.appleLogo,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// /////////////////////////////////////////////////////////////////////////
  /// ////////////////////// helper methods ///////////////////////////////////
  /// /////////////////////////////////////////////////////////////////////////
}
