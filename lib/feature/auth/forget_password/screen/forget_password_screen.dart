import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/forget_password/bloc/forget_password_bloc.dart';
import 'package:split/feature/auth/otp_verification/screen/otp_screen.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/feature/auth/widgets/app_text_form_field.dart';
import 'package:split/feature/auth/widgets/screen_description_widget.dart';
import 'package:split/feature/auth/widgets/screen_title_widget.dart';
import 'package:split/feature/auth/widgets/text_field_label_widget.dart';
import 'package:split/utils/locale/app_localization_keys.dart';
import 'package:split/utils/validations/auth_validate.dart';

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
    extends BaseScreenState<ForgetPasswordScreenWithBloc> with AuthValidate {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email;
  @override
  Widget baseScreenBuild(BuildContext context) {
    return BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          _openOtpScreen(context);
        } else if (state is ValidateForgetPasswordFormState) {
          _resetPassword(context);
        } else if (state is ResetPasswordLoadingState) {
          showLoading();
        } else if (state is NotValidateForgetPasswordFormState) {
          _autoValidateMode();
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
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScreenTitleWidget(
                      titleLocalizationKey:
                          LocalizationKeys.forgetYourPassword),
                  SizedBox(height: 8.h),
                  ScreenDescriptionWidget(
                      descriptionLocalizationKey:
                          LocalizationKeys.pleaseEnterYourEmailAddress),
                  SizedBox(height: 30.h),
                  TextFieldLabelWidget(
                      labelLocalizationKey: LocalizationKeys.email),
                  SizedBox(height: 8.h),
                  AppTextFormField(
                    hint: translate(LocalizationKeys.enterYourEmail)!,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      _saveEmailAddress(value);
                    },
                    validator: emailValidator,
                  ),
                  SizedBox(height: 150.h),
                  Row(
                    children: [
                      Expanded(
                        child: AppElevatedButton(
                          title: translate(LocalizationKeys.resetYourPassword)!,
                          onPressed: () {
                            _validateForgetPasswordFormEvent(context);
                          },
                        ),
                      ),
                    ],
                  ),
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

  void _validateForgetPasswordFormEvent(BuildContext context) {
    BlocProvider.of<ForgetPasswordBloc>(context)
        .add(ValidateForgetPasswordFormEvent(formKey: formKey));
  }

  void _autoValidateMode() {
    autovalidateMode = AutovalidateMode.always;
  }

  void _resetPassword(BuildContext context) {
    BlocProvider.of<ForgetPasswordBloc>(context)
        .add(ResetPasswordEvent(email: email!));
  }

  void _openOtpScreen(BuildContext context) {
    Navigator.of(context).pushNamed(OtpVerificationScreen.routName);
  }

  void _saveEmailAddress(String? value) {
    email = value;
  }
}
