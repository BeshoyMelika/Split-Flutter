import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/otp_verification/screen/otp_screen.dart';
import 'package:split/feature/auth/sign_in/screen/sign_in_screen.dart';
import 'package:split/feature/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/feature/auth/widgets/app_text_form_field.dart';
import 'package:split/feature/auth/widgets/social_button.dart';
import 'package:split/res/app_asset_paths.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';
import 'package:split/utils/validations/vaildtors_translator.dart';

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

class _SignUpScreenWithBlocState extends BaseScreenState<SignUpScreenWithBloc> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password, name, phone;
  @override
  Widget baseScreenBuild(BuildContext context) {
    TextFormValidatorsTranslator validate =
        TextFormValidatorsTranslator(context);
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          _openOtpScreen(context);
        } else if (state is SignInScreenState) {
          _openSignInScreen(context);
        } else if (state is ValidateRegisterState) {
          _register(context);
        } else if (state is NotValidateRegisterState) {
          autovalidateMode = AutovalidateMode.always;
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
                      translate(LocalizationKeys.signUp)!,
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
                      translate(LocalizationKeys.createYourOwnAccountNow)!,
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
                      translate(LocalizationKeys.name)!,
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
                      hint: translate(LocalizationKeys.enterYourName)!,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        name = value;
                      },
                      validator: validate.translatedUserName,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      translate(LocalizationKeys.emailAddress)!,
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
                      hint: translate(LocalizationKeys.enterYourEmailAddress)!,
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
                      translate(LocalizationKeys.phoneNumber)!,
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
                      hint: translate(LocalizationKeys.enterYourPhone)!,
                      keyboardType: TextInputType.phone,
                      onSaved: (value) {
                        phone = value;
                      },
                      validator: validate.translatedPhone,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      translate(LocalizationKeys.password)!,
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
                      hint: translate(LocalizationKeys.enterYourPassword)!,
                      keyboardType: TextInputType.visiblePassword,
                      secure: true,
                      onSaved: (value) {
                        password = value;
                      },
                      validator: validate.translatedPassword,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<SignUpBloc>(context)
                                .add(ChangeCheckIconEvent());
                          },
                          child: state is CheckAgreeState
                              ? const Icon(
                                  Icons.check_box,
                                  size: 20,
                                  color: AppColors.checkAgreeIcon,
                                )
                              : const Icon(
                                  Icons.check_box_outline_blank_sharp,
                                  size: 20,
                                  color: AppColors.checkAgreeIcon,
                                ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          translate(LocalizationKeys.iAgreeToAll)!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textOfAgreeToAll,
                          ),
                        ),
                        Text(
                          translate(LocalizationKeys.termsAndConditions)!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textOfTermsCondition,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: AppButton(
                          title: translate(LocalizationKeys.signUp)!,
                          onPressed: () {
                            BlocProvider.of<SignUpBloc>(context).add(
                                ValidateRegisterFormEvent(formKey: formKey));
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
                          translate(LocalizationKeys.orRegisterWith)!,
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
                              BlocProvider.of<SignUpBloc>(context)
                                  .add(RegisterWithGoogleEvent());
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
                              BlocProvider.of<SignUpBloc>(context)
                                  .add(RegisterWithAppleEvent());
                            },
                            title: translate(LocalizationKeys.apple)!,
                            image: AppAssetPaths.appleLogo,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          translate(LocalizationKeys.alreadyHaveAnAccount)!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textOfQuestion,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            BlocProvider.of<SignUpBloc>(context)
                                .add(SignInScreenEvent());
                          },
                          child: Text(
                            translate(LocalizationKeys.login)!,
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

  void _openOtpScreen(BuildContext context) {
    Navigator.of(context).pushNamed(OtpVerificationScreen.routName);
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
}
