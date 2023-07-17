import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/otp_verification/screen/otp_screen.dart';
import 'package:split/feature/auth/set_account/screen/set_account_screen.dart';
import 'package:split/feature/auth/sign_in/screen/sign_in_screen.dart';
import 'package:split/feature/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/feature/auth/widgets/app_text_form_field.dart';
import 'package:split/feature/auth/widgets/social_button.dart';
import 'package:split/res/app_asset_paths.dart';
import 'package:split/res/app_colors.dart';
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
        } else if (state is SignUpWithGoogleSuccessState ||
            state is SignUpWithAppleSuccessState) {
          _openSetAccountScreen(context);
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
                      translate(LocalizationKeys.signUp)!,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      translate(LocalizationKeys.createYourOwnAccountNow)!,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      translate(LocalizationKeys.name)!,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(height: 8.h),
                    AppTextFormField(
                      hint: translate(LocalizationKeys.enterYourName)!,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        name = value;
                      },
                      validator: textValidator,
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      translate(LocalizationKeys.emailAddress)!,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(height: 8.h),
                    AppTextFormField(
                      hint: translate(LocalizationKeys.enterYourEmailAddress)!,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        email = value;
                      },
                      validator: emailValidator,
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      translate(LocalizationKeys.phoneNumber)!,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(height: 8.h),
                    AppTextFormField(
                      hint: translate(LocalizationKeys.enterYourPhone)!,
                      keyboardType: TextInputType.phone,
                      onSaved: (value) {
                        phone = value;
                      },
                      validator: phoneNumberValidator,
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
                      keyboardType: TextInputType.visiblePassword,
                      secure: true,
                      onSaved: (value) {
                        password = value;
                      },
                      validator: passwordValidator,
                    ),
                    SizedBox(height: 18.h),
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
                        SizedBox(width: 5.w),
                        Text(
                          translate(LocalizationKeys.iAgreeToAll)!,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
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
                    SizedBox(height: 25.h),
                    Row(
                      children: [
                        Expanded(
                            child: AppElevatedButton(
                          title: translate(LocalizationKeys.signUp)!,
                          onPressed: () {
                            BlocProvider.of<SignUpBloc>(context).add(
                                ValidateRegisterFormEvent(formKey: formKey));
                          },
                        )),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          color: AppColors.divider,
                          height: 1,
                        )),
                        SizedBox(width: 5.w),
                        Text(
                          translate(LocalizationKeys.orRegisterWith)!,
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
                              BlocProvider.of<SignUpBloc>(context)
                                  .add(RegisterWithGoogleEvent());
                            },
                            title: translate(LocalizationKeys.google)!,
                            image: AppAssetPaths.googleLogo,
                          ),
                        ),
                        SizedBox(width: 10.w),
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
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        TextButton(
                          onPressed: () {
                            BlocProvider.of<SignUpBloc>(context)
                                .add(SignInScreenEvent());
                          },
                          child: Text(
                            translate(LocalizationKeys.login)!,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(fontSize: 14),
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

  void _openSetAccountScreen(BuildContext context) {
    Navigator.of(context).pushNamed(SetAccountScreen.routeName);
  }
}
