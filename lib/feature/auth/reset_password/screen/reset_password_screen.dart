import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/reset_password/bloc/reset_password_bloc.dart';
import 'package:split/feature/auth/success_message/screen/success_message_screen.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/feature/auth/widgets/app_text_form_field.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';
import 'package:split/utils/validations/vaildtors_translator.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});
  static const routeName = 'resetPasswordScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordBloc(),
      child: const ResetPasswordScreenWithBloc(),
    );
  }
}

class ResetPasswordScreenWithBloc extends BaseStatefulScreenWidget {
  const ResetPasswordScreenWithBloc({super.key});

  @override
  BaseScreenState<ResetPasswordScreenWithBloc> baseScreenCreateState() =>
      _ResetPasswordScreenWithBlocState();
}

class _ResetPasswordScreenWithBlocState
    extends BaseScreenState<ResetPasswordScreenWithBloc> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? newPassword, confirmNewPassword;
  @override
  Widget baseScreenBuild(BuildContext context) {
    TextFormValidatorsTranslator validate =
        TextFormValidatorsTranslator(context);
    return BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        if (state is SubmitPasswordSuccessState) {
          _openSuccessMessageScreen(context);
        } else if (state is ValidateResetPasswordFormState) {
          _submitPassword(context);
        } else if (state is NotValidateResetPasswordFormState) {
          autovalidateMode = AutovalidateMode.always;
        }
      },
      buildWhen: (previous, current) {
        if (current is NotValidateResetPasswordFormState) {
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
                      translate(LocalizationKeys.resetPassword)!,
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
                      translate(LocalizationKeys.pleaseEnterYourNewPassword)!,
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
                      translate(LocalizationKeys.newPassword)!,
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
                      hint: translate(LocalizationKeys.enterYourNewPassword)!,
                      keyboardType: TextInputType.visiblePassword,
                      secure: true,
                      onSaved: (value) {
                        newPassword = value;
                      },
                      validator: validate.translatedPassword,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      translate(LocalizationKeys.confirmNewPassword)!,
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
                      hint: translate(LocalizationKeys.confirmYourNewPassword)!,
                      keyboardType: TextInputType.visiblePassword,
                      secure: true,
                      onSaved: (value) {
                        confirmNewPassword = value;
                      },
                      validator: validate.translatedPassword,
                    ),
                    const SizedBox(
                      height: 75,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: AppButton(
                          title: translate(LocalizationKeys.submit)!,
                          onPressed: () {
                            BlocProvider.of<ResetPasswordBloc>(context).add(
                                ValidateResetPasswordFormEvent(
                                    formKey: formKey));
                          },
                        )),
                      ],
                    ),
                  ]),
            ),
          ),
        ));
      },
    );
  }

  void _openSuccessMessageScreen(BuildContext context) {
    Navigator.of(context).pushNamed(SuccessMessageScreen.routeName);
  }

  void _submitPassword(BuildContext context) {
    BlocProvider.of<ResetPasswordBloc>(context).add(SubmitPasswordEvent(
        newPassword: newPassword!, confirmNewPassword: confirmNewPassword!));
  }
}
