import 'package:flutter/material.dart';
import 'package:split/feature/auth/screens/success_message_screen.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/feature/auth/widgets/app_text_form_field.dart';
import 'package:split/res/app_colors.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({super.key});

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
        child: ResetPasswordForm(),
      ),
    );
  }
}

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({
    super.key,
  });

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? password, newPassword;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Reset Password',
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
              'Please enter your new password',
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
              'New Password',
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
              hint: 'Enter your new password',
              secure: true,
              onSaved: (value) {
                password = value;
              },
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Confirm New Password',
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
              hint: 'Confirm your new password',
              secure: true,
              onSaved: (value) {
                newPassword = value;
              },
            ),
            const SizedBox(
              height: 75,
            ),
            Row(
              children: [
                Expanded(
                    child: AppButton(
                  title: 'Submit',
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(SuccessMessageScreen.routeName);
                  },
                )),
              ],
            ),
          ]),
    );
  }
}
