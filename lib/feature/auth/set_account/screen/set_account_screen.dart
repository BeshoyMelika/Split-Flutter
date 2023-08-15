import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/set_account/bloc/set_account_bloc.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/feature/auth/widgets/app_text_form_field.dart';
import 'package:split/feature/auth/widgets/screen_description_widget.dart';
import 'package:split/feature/auth/widgets/screen_title_widget.dart';
import 'package:split/feature/auth/widgets/text_field_label_widget.dart';
import 'package:split/feature/home/screen/home_screen.dart';
import 'package:split/utils/locale/app_localization_keys.dart';
import 'package:split/utils/validations/auth_validate.dart';

class SetAccountScreen extends StatelessWidget {
  const SetAccountScreen({super.key});
  static const routeName = 'SetAccountScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetAccountBloc(),
      child: const SetAccountScreenWithBloc(),
    );
  }
}

class SetAccountScreenWithBloc extends BaseStatefulScreenWidget {
  const SetAccountScreenWithBloc({super.key});

  @override
  BaseScreenState<SetAccountScreenWithBloc> baseScreenCreateState() =>
      _SetAccountScreenWithBlocState();
}

class _SetAccountScreenWithBlocState
    extends BaseScreenState<SetAccountScreenWithBloc> with AuthValidate {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? userName;
  @override
  Widget baseScreenBuild(BuildContext context) {
    return BlocConsumer<SetAccountBloc, SetAccountState>(
      listener: (context, state) {
        if (state is SubmitSetAccountLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is SubmitSetAccountSuccessState) {
          _openHomeScreen(context);
        } else if (state is ValidateSetAccountState) {
          _submitSetAccount(context);
        } else if (state is NotValidateSetAccountState) {
          _autoValidateMode();
        }
      },
      buildWhen: (previous, current) {
        if (current is NotValidateSetAccountState) {
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
                      titleLocalizationKey: LocalizationKeys.setYourAccount),
                  SizedBox(height: 8.h),
                  ScreenDescriptionWidget(
                      descriptionLocalizationKey:
                          LocalizationKeys.pleaseSetUsernameAndPassword),
                  SizedBox(height: 30.h),
                  TextFieldLabelWidget(
                      labelLocalizationKey: LocalizationKeys.username),
                  SizedBox(height: 8.h),
                  AppTextFormField(
                    hint: translate(LocalizationKeys.setUsername)!,
                    keyboardType: TextInputType.text,
                    onSaved: _saveUsername,
                    validator: usernameValidator,
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Expanded(
                        child: AppElevatedButton(
                          title: translate(LocalizationKeys.submit)!,
                          onPressed: _validateSetAccountFormEvent,
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

  void _validateSetAccountFormEvent() {
    BlocProvider.of<SetAccountBloc>(context)
        .add(ValidateSetAccountFormEvent(formKey: formKey));
  }

  void _autoValidateMode() {
    autovalidateMode = AutovalidateMode.always;
  }

  void _openHomeScreen(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
  }

  void _submitSetAccount(BuildContext context) {
    BlocProvider.of<SetAccountBloc>(context)
        .add(SubmitSetAccountEvent(username: userName!));
  }

  void _saveUsername(String? value) {
    userName = value;
  }
}
