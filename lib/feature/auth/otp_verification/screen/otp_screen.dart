import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/otp_verification/bloc/otp_verification_bloc.dart';
import 'package:split/feature/auth/reset_password/screen/reset_password_screen.dart';
import 'package:split/feature/auth/success_message/screen/success_message_screen.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});
  static const routName = 'otpScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpVerificationBloc(),
      child: const OtpVerificationScreenWithBloc(),
    );
  }
}

class OtpVerificationScreenWithBloc extends BaseStatefulScreenWidget {
  const OtpVerificationScreenWithBloc({super.key});

  @override
  BaseScreenState<OtpVerificationScreenWithBloc> baseScreenCreateState() =>
      _OtpVerificationScreenWithBlocState();
}

class _OtpVerificationScreenWithBlocState
    extends BaseScreenState<OtpVerificationScreenWithBloc> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? pinCode;
  @override
  Widget baseScreenBuild(BuildContext context) {
    return BlocConsumer<OtpVerificationBloc, OtpVerificationState>(
      listener: (context, state) {
        if (state is OtpVerifySuccessState) {
          source
              ? _openResetScreen(context)
              : _openSuccessMessageScreen(context);
        } else if (state is ValidateOtpVerificationState) {
          _otpVerify(context);
        } else if (state is NotValidateOtpVerificationState) {
          autovalidateMode = AutovalidateMode.always;
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
            body: Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundOfWidget,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.r),
              topLeft: Radius.circular(10.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translate(LocalizationKeys.otpVerification)!,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    translate(LocalizationKeys
                        .an4DigitsCodeHasBeenSentToYourNumberEndingWith)!,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
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
                      // onSubmitted: (value) {
                      //   pinCode = value;
                      // },
                      validator: (s) {
                        return s == '2222' ? null : 'Pin is incorrect';
                      },
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      onCompleted: (pin) {
                        pinCode = pin;
                      },
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    children: [
                      Expanded(
                          child: AppElevatedButton(
                        title: translate(LocalizationKeys.verify)!,
                        onPressed: () {
                          BlocProvider.of<OtpVerificationBloc>(context).add(
                              ValidateOtpVerificationFormEvent(
                                  formKey: formKey));
                        },
                      )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        translate(LocalizationKeys.didNotReceiveACode)!,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          translate(LocalizationKeys.requestAgain)!,
                          style:Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }

  void _openSuccessMessageScreen(BuildContext context) {
    Navigator.of(context).pushNamed(SuccessMessageScreen.routeName);
  }

  void _openResetScreen(BuildContext context) {
    Navigator.of(context).pushNamed(ResetPasswordScreen.routeName);
  }

  void _otpVerify(BuildContext context) {
    BlocProvider.of<OtpVerificationBloc>(context)
        .add(OtpVerifyEvent(pinCode: pinCode!));
  }
}
