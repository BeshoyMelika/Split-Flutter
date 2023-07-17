import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translate(LocalizationKeys.resetPassword)!,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      translate(LocalizationKeys.pleaseEnterYourNewPassword)!,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      translate(LocalizationKeys.newPassword)!,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    AppTextFormField(
                      hint: translate(LocalizationKeys.enterYourNewPassword)!,
                      keyboardType: TextInputType.visiblePassword,
                      secure: true,
                      onSaved: (value) {
                        newPassword = value;
                      },
                      validator: validate.translatedPassword,
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      translate(LocalizationKeys.confirmNewPassword)!,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    AppTextFormField(
                      hint: translate(LocalizationKeys.confirmYourNewPassword)!,
                      keyboardType: TextInputType.visiblePassword,
                      secure: true,
                      onSaved: (value) {
                        confirmNewPassword = value;
                      },
                      validator: validate.translatedPassword,
                    ),
                    SizedBox(height: 75.h),
                    Row(
                      children: [
                        Expanded(
                            child: AppElevatedButton(
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
