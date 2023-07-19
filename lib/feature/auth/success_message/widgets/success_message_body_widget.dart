import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/auth/sign_in/screen/sign_in_screen.dart';
import 'package:split/feature/auth/success_message/bloc/success_message_bloc.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/feature/auth/widgets/screen_description_widget.dart';
import 'package:split/feature/auth/widgets/screen_title_widget.dart';
import 'package:split/res/app_asset_paths.dart';
import 'package:split/utils/locale/app_localization_keys.dart';



// ignore: must_be_immutable
class SuccessMessageBodyWidget extends BaseStatelessWidget {
  SuccessMessageBodyWidget({super.key});

  @override
  Widget baseBuild(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: 16.w, end: 16.w, top: 70.h, bottom: 24.h),
      child: Column(
        children: [
          SvgPicture.asset(AppAssetPaths.checkMarkSuccess),
          SizedBox(height: 20.h),
          ScreenTitleWidget(titleLocalizationKey: LocalizationKeys.congrats),
          SizedBox(height: 15.h),
          source
              ? ScreenDescriptionWidget(
                  descriptionLocalizationKey:
                      LocalizationKeys.resetPasswordSuccessfully)
              : ScreenDescriptionWidget(
                  descriptionLocalizationKey:
                      LocalizationKeys.youHaveSuccessfullyRegistered),
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
    );
  }

  /// /////////////////////////////////////////////////////////////////////////
  /// ////////////////////// helper methods ///////////////////////////////////
  /// /////////////////////////////////////////////////////////////////////////

  void _doneEvent(BuildContext context) {
    BlocProvider.of<SuccessMessageBloc>(context).add(DoneEvent());
  }
}
