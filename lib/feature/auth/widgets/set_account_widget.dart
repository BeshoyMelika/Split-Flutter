import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/feature/auth/auth_bloc/set_account_bloc/set_account_bloc.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/feature/auth/widgets/app_text_form_field.dart';
import 'package:split/res/app_colors.dart';

class SetAccountWidget extends StatelessWidget {
  const SetAccountWidget({super.key});

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
        child: SetAccountForm(),
      ),
    );
  }
}

class SetAccountForm extends StatefulWidget {
  const SetAccountForm({
    super.key,
  });

  @override
  State<SetAccountForm> createState() => _SetAccountFormState();
}

class _SetAccountFormState extends State<SetAccountForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? userName;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Set your account',
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
              'Please set username and password',
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
              'Username',
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
              hint: 'Set username',
              onSaved: (value) {
                userName = value;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                    child: AppButton(
                  title: 'Submit',
                  onPressed: () {
                    BlocProvider.of<SetAccountBloc>(context)
                        .add(SubmitSetAccountEvent());
                  },
                )),
              ],
            ),
          ]),
    );
  }
}
