import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/forget_password/screen/forget_password_screen.dart';
import 'package:split/feature/auth/sign_in/widgets/dont_have_account_text_widget.dart';
import 'package:split/feature/auth/sign_in/widgets/forget_password_text_button_widget.dart';
import 'package:split/feature/auth/sign_up/screen/sign_up_screen.dart';
import 'package:split/feature/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/feature/auth/widgets/app_text_form_field.dart';
import 'package:split/feature/auth/widgets/screen_description_widget.dart';
import 'package:split/feature/auth/widgets/screen_title_widget.dart';
import 'package:split/feature/auth/widgets/social_media_login_signup_widget.dart';
import 'package:split/feature/auth/widgets/text_field_label_widget.dart';
import 'package:split/feature/home/screen/home_screen.dart';
import 'package:split/utils/locale/app_localization_keys.dart';
import 'package:split/utils/validations/auth_validate.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  static const routeName = 'signInScreen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: const SignInScreenWithBloc(),
    );
  }
}

class SignInScreenWithBloc extends BaseStatefulScreenWidget {
  const SignInScreenWithBloc({super.key});

  @override
  BaseScreenState<SignInScreenWithBloc> baseScreenCreateState() =>
      _SignInScreenWithBlocState();
}

class _SignInScreenWithBlocState extends BaseScreenState<SignInScreenWithBloc>
    with AuthValidate {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password;

  @override
  Widget baseScreenBuild(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is LoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is SignInSuccessState) {
          _openHomeScreen(context);
        } else if (state is OpenForgetPasswordScreenState) {
          _openForgetScreen(context);
        } else if (state is OpenSignUpScreenState) {
          _openSignUpScreen(context);
        } else if (state is ValidateLoginState) {
          _login(context);
        } else if (state is NotValidateLoginState) {
          _autoValidateMode();
        }
      },
      buildWhen: (previous, current) {
        if (current is NotValidateLoginState) {
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
                      titleLocalizationKey: LocalizationKeys.signIn),
                  SizedBox(height: 8.h),
                  ScreenDescriptionWidget(
                      descriptionLocalizationKey:
                          LocalizationKeys.pleaseEnterYourDetails),
                  SizedBox(height: 30.h),
                  TextFieldLabelWidget(
                      labelLocalizationKey: LocalizationKeys.email),
                  SizedBox(height: 8.h),
                  AppTextFormField(
                    hint: translate(LocalizationKeys.enterYourEmail)!,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: _saveEmailAddress,
                    validator: emailValidator,
                  ),
                  SizedBox(height: 24.h),
                  TextFieldLabelWidget(
                      labelLocalizationKey: LocalizationKeys.password),
                  SizedBox(height: 8.h),
                  AppTextFormField(
                    hint: translate(LocalizationKeys.enterYourPassword)!,
                    secure: true,
                    keyboardType: TextInputType.visiblePassword,
                    onSaved: _savePassword,
                    validator: passwordValidator,
                  ),
                  ForgetPasswordTextButtonWidget(),
                  Row(
                    children: [
                      Expanded(
                        child: AppElevatedButton(
                            title: translate(LocalizationKeys.signIn)!,
                            onPressed: _validateLoginFormEvent),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  SocialMediaLoginAndSignUpWidget(
                    textORLocalizationKey: LocalizationKeys.orSignInWith,
                    googleOnPressed: () {
                      _loginWithGoogleEvent(context);
                    },
                    appleOnPressed: () {
                      _loginWithAppleEvent(context);
                    },
                  ),
                  SizedBox(height: 18.h),
                  DontHaveAccountWidget(),
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

  void _autoValidateMode() {
    autovalidateMode = AutovalidateMode.always;
  }

  void _validateLoginFormEvent() {
    BlocProvider.of<SignInBloc>(context)
        .add(ValidateLoginFormEvent(formKey: formKey));
  }

  void _loginWithGoogleEvent(BuildContext context) {
    BlocProvider.of<SignInBloc>(context).add(LoginWithGoogleEvent());
  }

  void _loginWithAppleEvent(BuildContext context) {
    BlocProvider.of<SignInBloc>(context).add(LoginWithAppleEvent());
  }

  void _openHomeScreen(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
  }

  void _openForgetScreen(BuildContext context) {
    Navigator.of(context).pushNamed(ForgetPasswordScreen.routeName);
  }

  void _openSignUpScreen(BuildContext context) {
    Navigator.of(context).pushNamed(SignUpScreen.routeName);
  }

  void _login(BuildContext context) {
    BlocProvider.of<SignInBloc>(context)
        .add(LoginEvent(email: email!, password: password!));
  }

  void _savePassword(String? value) {
    password = value;
  }

  void _saveEmailAddress(String? value) {
    email = value;
  }
}
