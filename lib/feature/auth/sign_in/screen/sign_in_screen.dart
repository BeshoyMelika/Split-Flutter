import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:split/utils/validations/vaildtors_translator.dart';

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
                      translate(LocalizationKeys.signIn)!,
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
                      translate(LocalizationKeys.plzEnterYourDetails)!,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.descriptionOfWidget,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      translate(LocalizationKeys.email)!,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.titleOfTextField,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppTextFormField(
                      hint: translate(LocalizationKeys.enterYourEmail)!,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        email = value;
                      },
                      validator: validate.translatedEmail,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      translate(LocalizationKeys.password)!,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
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
                            style: const TextStyle(
                              color: AppColors.textOfQuestion,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: AppButton(
                          title: translate(LocalizationKeys.signIn)!,
                          onPressed: () {
                            BlocProvider.of<SignInBloc>(context)
                                .add(ValidateLoginFormEvent(formKey: formKey));
                          },
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          color: AppColors.divider,
                          height: 1,
                        )),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          translate(LocalizationKeys.orSignInWith)!,
                          style: const TextStyle(
                            color: AppColors.textBetweenDivider,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Container(
                          color: AppColors.divider,
                          height: 1,
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
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
                        const SizedBox(
                          width: 10,
                        ),
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
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          translate(LocalizationKeys.doNotHaveAnAccount)!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textOfQuestion,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            BlocProvider.of<SignInBloc>(context)
                                .add(SignUpScreenEvent());
                          },
                          child: Text(
                            translate(LocalizationKeys.signUp)!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color:
                                  AppColors.textButtonOfSignInOutRequestAgain,
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
