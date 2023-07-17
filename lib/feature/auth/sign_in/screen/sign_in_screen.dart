import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/forget_password/screen/forget_password_screen.dart';
import 'package:split/feature/auth/sign_up/screen/sign_up_screen.dart';
import 'package:split/feature/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:split/feature/auth/success_message/screen/success_message_screen.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/feature/auth/widgets/app_text_form_field.dart';
import 'package:split/feature/auth/widgets/social_button.dart';
import 'package:split/feature/home/screen/home_screen.dart';
import 'package:split/res/app_asset_paths.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

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

class _SignInScreenWithBlocState extends BaseScreenState<SignInScreenWithBloc> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password;

  @override
  Widget baseScreenBuild(BuildContext context) {
    TextFormValidatorsTranslator validate =
        TextFormValidatorsTranslator(context);

    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          _openHomeScreen(context);
        } else if (state is ForgetPasswordState) {
          source = true;
          _openForgetScreen(context);
        } else if (state is SignUpScreenState) {
          source = false;
          _openSignUpScreen(context);
        } else if (state is ValidateLoginState) {
          _login(context);
        } else if (state is NotValidateLoginState) {
          autovalidateMode = AutovalidateMode.always;
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
                      translate(LocalizationKeys.signIn)!,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      translate(LocalizationKeys.plzEnterYourDetails)!,
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
                    SizedBox(height: 24.h),
                    Text(
                      translate(LocalizationKeys.password)!,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(height: 8.h),
                    AppTextFormField(
                      hint: translate(LocalizationKeys.enterYourPassword)!,
                      secure: true,
                      keyboardType: TextInputType.visiblePassword,
                      onSaved: (value) {
                        password = value;
                      },
                      validator: validate.translatedPassword,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            BlocProvider.of<SignInBloc>(context)
                                .add(ForgetPasswordEvent());
                          },
                          child: Text(
                            translate(LocalizationKeys.forgetPassword)!,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: AppElevatedButton(
                          title: translate(LocalizationKeys.signIn)!,
                          onPressed: () {
                            BlocProvider.of<SignInBloc>(context)
                                .add(ValidateLoginFormEvent(formKey: formKey));
                          },
                        )),
                      ],
                    ),
                    SizedBox(height: 25.h),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          color: AppColors.divider,
                          height: 1,
                        )),
                        SizedBox(width: 5.w),
                        Text(
                          translate(LocalizationKeys.orSignInWith)!,
                          style: const TextStyle(
                            color: AppColors.textBetweenDivider,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
                            onPressed: () {
                              BlocProvider.of<SignInBloc>(context)
                                  .add(LoginWithGoogleEvent());
                            },
                            title: translate(LocalizationKeys.google)!,
                            image: AppAssetPaths.googleLogo,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: SocialButton(
                            onPressed: () {
                              BlocProvider.of<SignInBloc>(context)
                                  .add(LoginWithAppleEvent());
                            },
                            title: translate(LocalizationKeys.apple)!,
                            image: AppAssetPaths.appleLogo,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          translate(LocalizationKeys.doNotHaveAnAccount)!,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        TextButton(
                          onPressed: () {
                            BlocProvider.of<SignInBloc>(context)
                                .add(SignUpScreenEvent());
                          },
                          child: Text(
                            translate(LocalizationKeys.signUp)!,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
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
          ),
        );
      },
    );
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
}
