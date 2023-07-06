import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/feature/auth/auth_bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/feature/auth/widgets/app_text_form_field.dart';
import 'package:split/feature/auth/widgets/social_button.dart';
import 'package:split/res/app_asset_paths.dart';
import 'package:split/res/app_colors.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroundOfWidget,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SignUpForm(),
      ),
    );
  }
}

// form of Sign Up
class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? email, password, name, phone;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 27.0,
              fontWeight: FontWeight.w700,
              color: AppColors.titleOfWidget,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Create your own account now.',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: AppColors.descriptionOfWidget,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Name',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: AppColors.titleOfTextField,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          AppTextFormField(
            hint: 'Enter your name',
            onSaved: (value) {
              name = value;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Email Address',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: AppColors.titleOfTextField,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          AppTextFormField(
            hint: 'Enter your email address',
            onSaved: (value) {
              email = value;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Phone Number',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: AppColors.titleOfTextField,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          AppTextFormField(
            hint: 'Enter your phone',
            onSaved: (value) {
              phone = value;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Password',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: AppColors.titleOfTextField,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          AppTextFormField(
            hint: 'Enter your password',
            secure: true,
            onSaved: (value) {
              password = value;
            },
          ),
          const SizedBox(
            height: 18,
          ),
          const Row(
            children: [
              Icon(
                Icons.check_box,
                size: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'I agree to all',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textOfAgreeToAll,
                ),
              ),
              Text(
                ' Terms & Conditions',
                style: TextStyle(
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
                title: 'Sign Up',
                onPressed: () {
                  BlocProvider.of<SignUpBloc>(context).add(RegisterEvent());
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
              const Text(
                'Or register with',
                style: TextStyle(
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
                  title: 'Google',
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
                  title: 'Apple',
                  image: AppAssetPaths.appleLogo,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textOfQuestion,
                ),
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<SignUpBloc>(context).add(SignInScreenEvent());
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
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
    );
  }
}
