import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/auth/success_message/bloc/success_message_bloc.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/res/app_asset_paths.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

bool source = true;

// ignore: must_be_immutable
class SuccessMessageBodyWidget extends BaseStatelessWidget {
  SuccessMessageBodyWidget({super.key});

  @override
  Widget baseBuild(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundOfWidget,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.r),
          topLeft: Radius.circular(10.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            start: 16.w, end: 16.w, top: 70.h, bottom: 24.h),
        child: Column(
          children: [
            SvgPicture.asset(AppAssetPaths.checkMarkSuccess),
            SizedBox(height: 20.h),
            Text(
              translate(LocalizationKeys.congrats)!,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            SizedBox(height: 15.h),
            Text(
              source
                  ? translate(LocalizationKeys.resetPasswordSuccessfully)!
                  : translate(LocalizationKeys.youHaveSuccessfullyRegistered)!,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(height: 72.h),
            Row(
              children: [
                Expanded(
                    child: AppElevatedButton(
                  title: translate(LocalizationKeys.done)!,
                  onPressed: () {
                    _doneEvent(context);
                  },
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// /////////////////////////////////////////////////////////////////////////
  /// ////////////////////// helper methods ///////////////////////////////////
  /// /////////////////////////////////////////////////////////////////////////

  void _doneEvent(BuildContext context) {
    BlocProvider.of<SuccessMessageBloc>(context).add(DoneEvent());
  }
}
