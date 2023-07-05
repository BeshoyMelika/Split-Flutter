import 'package:flutter/material.dart';
import 'package:split/feature/auth/screens/reset_password_screen.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/feature/auth/widgets/app_text_form_field.dart';
import 'package:split/res/app_colors.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

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
        child: ForgetPasswordForm(),
      ),
    );
  }
}

//Form of Forget Password
class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({
    super.key,
  });

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Forget your password?',
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
              'Please enter your email address',
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
              height: 150,
            ),
            Row(
              children: [
                Expanded(
                    child: AppButton(
                  title: 'Reset your password',
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(ResetPasswordScreen.routeName);
                  },
                )),
              ],
            ),
          ]),
    );
  }
}
