import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/constants.dart';
import 'package:split/feature/auth/otp_verification/bloc/otp_verification_bloc.dart';
import 'package:split/feature/auth/otp_verification/widgets/dont_receive_code_text_widget.dart';
import 'package:split/feature/auth/reset_password/screen/reset_password_screen.dart';
import 'package:split/feature/auth/success_message/screen/success_message_screen.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/feature/auth/widgets/screen_description_widget.dart';
import 'package:split/feature/auth/widgets/screen_title_widget.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';
import 'package:split/utils/validations/auth_validate.dart';

enum ScreenAfterOtp { resetPasswordScreen, congratsScreen }

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});
  static const routName = 'otpScreen';
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    debugPrint(arguments.toString());
    return BlocProvider(
      create: (context) => OtpVerificationBloc(),
      child: OtpVerificationScreenWithBloc(
        screenAfterOtp: arguments[kScreenAfterOtp],
        phoneNumber: arguments[kPhoneNumber],
        email: arguments[kEmail],
      ),
    );
  }
}

class OtpVerificationScreenWithBloc extends BaseStatefulScreenWidget {
  const OtpVerificationScreenWithBloc({
    super.key,
    required this.screenAfterOtp,
    this.phoneNumber,
    this.email,
  });
  final String? phoneNumber;
  final String? email;
  final ScreenAfterOtp screenAfterOtp;
  @override
  BaseScreenState<OtpVerificationScreenWithBloc> baseScreenCreateState() =>
      _OtpVerificationScreenWithBlocState();
}

class _OtpVerificationScreenWithBlocState
    extends BaseScreenState<OtpVerificationScreenWithBloc> with AuthValidate {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? pinCode;
  final ScreenBeforeCongrats screenBeforeCongrats =
      ScreenBeforeCongrats.otpScreen;
  @override
  Widget baseScreenBuild(BuildContext context) {
    String newPhoneNumber =
        widget.phoneNumber?.replaceRange(0, 8, "********") ?? '';
    debugPrint(newPhoneNumber);
    return BlocConsumer<OtpVerificationBloc, OtpVerificationState>(
      listener: (context, state) {
        if (state is OtpVerifyLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is OtpVerifySuccessState) {
          switch (widget.screenAfterOtp) {
            case ScreenAfterOtp.congratsScreen:
              _openSuccessMessageScreen(context);
              break;
            case ScreenAfterOtp.resetPasswordScreen:
              _openResetScreen(context);
              break;
          }
        } else if (state is ValidateOtpVerificationState) {
          _otpVerify(context);
        } else if (state is NotValidateOtpVerificationState) {
          _autoValidateMode();
        }
      },
      buildWhen: (previous, current) {
        if (current is NotValidateOtpVerificationState) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        return AuthBase(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScreenTitleWidget(
                      titleLocalizationKey: LocalizationKeys.otpVerification),
                  SizedBox(height: 8.h),
                  ScreenDescriptionWidget(
                      descriptionLocalizationKey: LocalizationKeys
                          .an4DigitsCodeHasBeenSentToYourNumberEndingWith,
                      append: widget.screenAfterOtp ==
                              ScreenAfterOtp.resetPasswordScreen
                          ? widget.email
                          : newPhoneNumber),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: width.w,
                    child: Pinput(
                      length: 4,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      defaultPinTheme: PinTheme(
                        height: 70.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundOfOtp,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: AppColors.textFieldBorder,
                          ),
                        ),
                      ),
                      validator: otpValidator,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      onCompleted: _onCompletedOtp,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    children: [
                      Expanded(
                        child: AppElevatedButton(
                          title: translate(LocalizationKeys.verify)!,
                          onPressed: _validateOtpVerificationFormEvent,
                        ),
                      ),
                    ],
                  ),
                  DontReceiveCodeTextWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// /////////////////////////////////////////////////////////////////////////
  /// ////////////////////// helper methods ///////////////////////////////////
  /// /////////////////////////////////////////////////////////////////////////

  void _validateOtpVerificationFormEvent() {
    BlocProvider.of<OtpVerificationBloc>(context)
        .add(ValidateOtpVerificationFormEvent(formKey: formKey));
  }

  void _autoValidateMode() {
    autovalidateMode = AutovalidateMode.always;
  }

  void _openSuccessMessageScreen(BuildContext context) {
    Navigator.of(context).pushNamed(SuccessMessageScreen.routeName,
        arguments: {kScreenBeforeCongrats: screenBeforeCongrats});
  }

  void _openResetScreen(BuildContext context) {
    Navigator.of(context).pushNamed(ResetPasswordScreen.routeName);
  }

  void _otpVerify(BuildContext context) {
    BlocProvider.of<OtpVerificationBloc>(context)
        .add(OtpVerifyEvent(pinCode: pinCode!));
  }

  void _onCompletedOtp(String pin) {
    pinCode = pin;
  }
}
