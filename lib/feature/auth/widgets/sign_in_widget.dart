import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/feature/auth/auth_bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:split/feature/auth/screens/forget_password_screen.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/feature/auth/widgets/app_text_form_field.dart';
import 'package:split/feature/auth/widgets/social_button.dart';
import 'package:split/res/app_asset_paths.dart';
import 'package:split/res/app_colors.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});
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
        child: SignInForm(),
      ),
    );
  }
}

// Form of Sign In
class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'Sign In',
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
            'Please enter your details',
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
            'Email',
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
            hint: 'Enter your email',
            onSaved: (value) {
              email = value;
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
              color: Color(0xFF333333),
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
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(ForgetPasswordScreen.routeName);
                },
                child: const Text(
                  'Forget password?',
                  style: TextStyle(
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
                title: 'Sign In',
                onPressed: () {
                  BlocProvider.of<SignInBloc>(context).add(LoginEvent());
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
                'Or sign in with',
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
          const Row(
            children: [
              Expanded(
                child: SocialButton(
                  title: 'Google',
                  image: AppAssetPaths.googleLogo,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: SocialButton(
                    title: 'Apple', image: AppAssetPaths.appleLogo),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don’t have an account?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textOfQuestion,
                ),
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<SignInBloc>(context).add(GoToSignUpEvent());
                },
                child: const Text(
                  'Sign up',
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
