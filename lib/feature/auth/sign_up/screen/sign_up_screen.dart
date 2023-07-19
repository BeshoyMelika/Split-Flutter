import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/otp_verification/screen/otp_screen.dart';
import 'package:split/feature/auth/set_account/screen/set_account_screen.dart';
import 'package:split/feature/auth/sign_in/screen/sign_in_screen.dart';
import 'package:split/feature/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:split/feature/auth/sign_up/widgets/already_have_account_text_widget.dart';
import 'package:split/feature/auth/sign_up/widgets/check_agree_row_widget.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/feature/auth/widgets/app_text_form_field.dart';
import 'package:split/feature/auth/widgets/screen_description_widget.dart';
import 'package:split/feature/auth/widgets/screen_title_widget.dart';
import 'package:split/feature/auth/widgets/social_media_login_signup_widget.dart';
import 'package:split/feature/auth/widgets/text_field_label_widget.dart';
import 'package:split/utils/locale/app_localization_keys.dart';
import 'package:split/utils/validations/auth_validate.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const routeName = 'signUpScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: const SignUpScreenWithBloc(),
    );
  }
}

class SignUpScreenWithBloc extends BaseStatefulScreenWidget {
  const SignUpScreenWithBloc({super.key});

  @override
  BaseScreenState<SignUpScreenWithBloc> baseScreenCreateState() =>
      _SignUpScreenWithBlocState();
}

class _SignUpScreenWithBlocState extends BaseScreenState<SignUpScreenWithBloc>
    with AuthValidate {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password, name, phone;
  @override
  Widget baseScreenBuild(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          _openOtpScreen(context);
        } else if (state is LoadingState) {
          showLoading();
        } else if (state is SignUpWithGoogleSuccessState ||
            state is SignUpWithAppleSuccessState) {
          _openSetAccountScreen(context);
        } else if (state is OpenSignInScreenState) {
          _openSignInScreen(context);
        } else if (state is ValidateRegisterState) {
          _register(context);
        } else if (state is NotValidateRegisterState) {
          _autoValidateMode();
        }
      },
      buildWhen: (previous, current) {
        if (current is NotValidateRegisterState ||
            current is CheckAgreeState ||
            current is NotCheckAgreeState) {
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
                      titleLocalizationKey: LocalizationKeys.signUp),
                  SizedBox(height: 8.h),
                  ScreenDescriptionWidget(
                      descriptionLocalizationKey:
                          LocalizationKeys.createYourOwnAccountNow),
                  SizedBox(height: 30.h),
                  TextFieldLabelWidget(
                      labelLocalizationKey: LocalizationKeys.name),
                  SizedBox(height: 8.h),
                  AppTextFormField(
                    hint: translate(LocalizationKeys.enterYourName)!,
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      _saveName(value);
                    },
                    validator: textValidator,
                  ),
                  SizedBox(height: 24.h),
                  TextFieldLabelWidget(
                      labelLocalizationKey: LocalizationKeys.emailAddress),
                  SizedBox(height: 8.h),
                  AppTextFormField(
                    hint: translate(LocalizationKeys.enterYourEmailAddress)!,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      _saveEmailAddress(value);
                    },
                    validator: emailValidator,
                  ),
                  SizedBox(height: 24.h),
                  TextFieldLabelWidget(
                      labelLocalizationKey: LocalizationKeys.phoneNumber),
                  SizedBox(height: 8.h),
                  AppTextFormField(
                    hint: translate(LocalizationKeys.enterYourPhone)!,
                    keyboardType: TextInputType.phone,
                    onSaved: (value) {
                      _savePhoneNumber(value);
                    },
                    validator: phoneNumberValidator,
                  ),
                  SizedBox(height: 24.h),
                  TextFieldLabelWidget(
                      labelLocalizationKey: LocalizationKeys.password),
                  SizedBox(height: 8.h),
                  AppTextFormField(
                    hint: translate(LocalizationKeys.enterYourPassword)!,
                    keyboardType: TextInputType.visiblePassword,
                    secure: true,
                    onSaved: (value) {
                      _savePassword(value);
                    },
                    validator: passwordValidator,
                  ),
                  SizedBox(height: 18.h),
                  CheckAgreeRowWidget(state: state),
                  SizedBox(height: 25.h),
                  Row(
                    children: [
                      Expanded(
                          child: AppElevatedButton(
                        title: translate(LocalizationKeys.signUp)!,
                        onPressed: () {
                          _validateRegisterFormEvent(context);
                        },
                      )),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SocialMediaLoginAndSignUpWidget(
                    textORLocalizationKey: LocalizationKeys.orRegisterWith,
                    googleOnPressed: () {
                      _registerWithGoogleEvent(context);
                    },
                    appleOnPressed: () {
                      _registerWithAppleEvent(context);
                    },
                  ),
                  AlreadyHaveAccountWidget(),
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

  void _openOtpScreen(BuildContext context) {
    Navigator.of(context)
        .pushNamed(OtpVerificationScreen.routName, arguments: phone);
  }

  void _openSignInScreen(BuildContext context) {
    Navigator.of(context).pushNamed(SignInScreen.routeName);
  }

  void _register(BuildContext context) {
    BlocProvider.of<SignUpBloc>(context).add(RegisterEvent(
      email: email!,
      password: password!,
      name: name!,
      phone: phone!,
    ));
  }

  void _openSetAccountScreen(BuildContext context) {
    Navigator.of(context).pushNamed(SetAccountScreen.routeName);
  }

  void _validateRegisterFormEvent(BuildContext context) {
    BlocProvider.of<SignUpBloc>(context)
        .add(ValidateRegisterFormEvent(formKey: formKey));
  }

  void _registerWithGoogleEvent(BuildContext context) {
    BlocProvider.of<SignUpBloc>(context).add(RegisterWithGoogleEvent());
  }

  void _registerWithAppleEvent(BuildContext context) {
    BlocProvider.of<SignUpBloc>(context).add(RegisterWithAppleEvent());
  }

  void _autoValidateMode() {
    autovalidateMode = AutovalidateMode.always;
  }

  void _savePassword(String? value) {
    password = value;
  }

  void _savePhoneNumber(String? value) {
    phone = value;
  }

  void _saveEmailAddress(String? value) {
    email = value;
  }

  void _saveName(String? value) {
    name = value;
  }
}
