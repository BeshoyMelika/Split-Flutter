import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/reset_password/bloc/reset_password_bloc.dart';
import 'package:split/feature/auth/success_message/screen/success_message_screen.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/feature/auth/widgets/app_text_form_field.dart';
import 'package:split/feature/auth/widgets/screen_description_widget.dart';
import 'package:split/feature/auth/widgets/screen_title_widget.dart';
import 'package:split/feature/auth/widgets/text_field_label_widget.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';
import 'package:split/utils/validations/auth_validate.dart';

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
    extends BaseScreenState<ResetPasswordScreenWithBloc> with AuthValidate {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? newPassword, confirmNewPassword;
  TextEditingController? newPasswordController, confirmNewPasswordController;
  @override
  Widget baseScreenBuild(BuildContext context) {
    return BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        if (state is SubmitPasswordSuccessState) {
          _openSuccessMessageScreen(context);
        } else if (state is ValidateResetPasswordFormState) {
          _submitPassword(context);
        } else if (state is SubmitPasswordLoadingState) {
          showLoading();
        } else if (state is NotValidateResetPasswordFormState) {
          _autoValidateMode();
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
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScreenTitleWidget(
                      titleLocalizationKey: LocalizationKeys.resetPassword),
                  SizedBox(height: 8.h),
                  ScreenDescriptionWidget(
                      descriptionLocalizationKey:
                          LocalizationKeys.pleaseEnterYourNewPassword),
                  SizedBox(height: 30.h),
                  TextFieldLabelWidget(
                      labelLocalizationKey: LocalizationKeys.newPassword),
                  SizedBox(height: 8.h),
                  AppTextFormField(
                    hint: translate(LocalizationKeys.enterYourNewPassword)!,
                    keyboardType: TextInputType.visiblePassword,
                    secure: true,
                    controller: newPasswordController,
                    onSaved: (value) {
                      _saveNewPassword(value);
                    },
                    validator: passwordValidator,
                  ),
                  SizedBox(height: 24.h),
                  TextFieldLabelWidget(
                      labelLocalizationKey:
                          LocalizationKeys.confirmNewPassword),
                  SizedBox(height: 8.h),
                  AppTextFormField(
                    hint: translate(LocalizationKeys.confirmYourNewPassword)!,
                    keyboardType: TextInputType.visiblePassword,
                    secure: true,
                    controller: confirmNewPasswordController,
                    onSaved: (value) {
                      _saveConfirmNewPassword(value);
                    },
                    //validator: confirmPasswordValidator(confirmNewPasswordController!.text,newPasswordController!.text),
                  ),
                  SizedBox(height: 75.h),
                  Row(
                    children: [
                      Expanded(
                        child: AppElevatedButton(
                          title: translate(LocalizationKeys.submit)!,
                          onPressed: () {
                            _validateResetPasswordFormEvent(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// /////////////////////////////////////////////////////////////////////////
  /// ////////////////////// helper methods ///////////////////////////////////
  /// /////////////////////////////////////////////////////////////////////////

  void _validateResetPasswordFormEvent(BuildContext context) {
    BlocProvider.of<ResetPasswordBloc>(context)
        .add(ValidateResetPasswordFormEvent(formKey: formKey));
  }

  void _autoValidateMode() {
    autovalidateMode = AutovalidateMode.always;
  }

  void _openSuccessMessageScreen(BuildContext context) {
    Navigator.of(context).pushNamed(SuccessMessageScreen.routeName);
  }

  void _submitPassword(BuildContext context) {
    BlocProvider.of<ResetPasswordBloc>(context).add(SubmitPasswordEvent(
        newPassword: newPassword!, confirmNewPassword: confirmNewPassword!));
  }

  void _saveConfirmNewPassword(String? value) {
    confirmNewPassword = value;
  }

  void _saveNewPassword(String? value) {
    newPassword = value;
  }
}
