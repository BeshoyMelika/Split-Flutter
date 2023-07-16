import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          decoration: const BoxDecoration(
            color: AppColors.backgroundOfWidget,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translate(LocalizationKeys.otpVerification)!,
                    style: const TextStyle(
                      fontSize: 27.0,
                      fontWeight: FontWeight.w700,
                      color: AppColors.titleOfWidget,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    translate(LocalizationKeys
                        .an4DigitsCodeHasBeenSentToYourNumberEndingWith)!,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.descriptionOfWidget,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Pinput(
                      length: 4,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      defaultPinTheme: PinTheme(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundOfOtp,
                          borderRadius: BorderRadius.circular(10),
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
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: AppButton(
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
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textOfQuestion,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          translate(LocalizationKeys.requestAgain)!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textButtonOfSignInOutRequestAgain,
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
