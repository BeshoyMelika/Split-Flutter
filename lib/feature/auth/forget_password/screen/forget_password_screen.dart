import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/forget_password/bloc/forget_password_bloc.dart';
import 'package:split/feature/auth/otp_verification/screen/otp_screen.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/feature/auth/widgets/app_text_form_field.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';
import 'package:split/utils/validations/vaildtors_translator.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});
  static const routeName = 'forgetPasswordScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordBloc(),
      child: const ForgetPasswordScreenWithBloc(),
    );
  }
}

class ForgetPasswordScreenWithBloc extends BaseStatefulScreenWidget {
  const ForgetPasswordScreenWithBloc({super.key});

  @override
  BaseScreenState<ForgetPasswordScreenWithBloc> baseScreenCreateState() =>
      _ForgetPasswordScreenWithBlocState();
}

class _ForgetPasswordScreenWithBlocState
    extends BaseScreenState<ForgetPasswordScreenWithBloc> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email;
  @override
  Widget baseScreenBuild(BuildContext context) {
    TextFormValidatorsTranslator validate =
        TextFormValidatorsTranslator(context);
    return BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          _openOtpScreen(context);
        } else if (state is ValidateForgetPasswordFormState) {
          _resetPassword(context);
        } else if (state is NotValidateForgetPasswordFormState) {
          autovalidateMode = AutovalidateMode.always;
        }
      },
      buildWhen: (previous, current) {
        if (current is NotValidateForgetPasswordFormState) {
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
                        translate(LocalizationKeys.forgetYourPassword)!,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        translate(
                            LocalizationKeys.pleaseEnterYourEmailAddress)!,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        translate(LocalizationKeys.email)!,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      SizedBox(height: 8.h),
                      AppTextFormField(
                        hint: translate(LocalizationKeys.enterYourEmail)!,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          email = value;
                        },
                        validator: validate.translatedEmail,
                      ),
                      SizedBox(height: 150.h),
                      Row(
                        children: [
                          Expanded(
                              child: AppElevatedButton(
                            title:
                                translate(LocalizationKeys.resetYourPassword)!,
                            onPressed: () {
                              BlocProvider.of<ForgetPasswordBloc>(context).add(
                                  ValidateForgetPasswordFormEvent(
                                      formKey: formKey));
                            },
                          )),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }

  void _resetPassword(BuildContext context) {
    BlocProvider.of<ForgetPasswordBloc>(context)
        .add(ResetPasswordEvent(email: email!));
  }

  void _openOtpScreen(BuildContext context) {
    Navigator.of(context).pushNamed(OtpVerificationScreen.routName);
  }
}
