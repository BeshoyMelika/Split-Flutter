import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/set_account/bloc/set_account_bloc.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/feature/auth/widgets/app_text_form_field.dart';
import 'package:split/feature/home/screen/home_screen.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

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
    extends BaseScreenState<SetAccountScreenWithBloc> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? userName;
  @override
  Widget baseScreenBuild(BuildContext context) {
    TextFormValidatorsTranslator validate =
        TextFormValidatorsTranslator(context);
    return BlocConsumer<SetAccountBloc, SetAccountState>(
      listener: (context, state) {
        if (state is SubmitSetAccountSuccessState) {
          _openHomeScreen(context);
        } else if (state is ValidateSetAccountState) {
          _submitSetAccount(context);
        } else if (state is NotValidateSetAccountState) {
          autovalidateMode = AutovalidateMode.always;
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
                      translate(LocalizationKeys.setYourAccount)!,
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
                      translate(LocalizationKeys.pleaseSetUsernameAndPassword)!,
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
                      translate(LocalizationKeys.username)!,
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
                      hint: translate(LocalizationKeys.setUsername)!,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        userName = value;
                      },
                      validator: validate.translatedUserName,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: AppButton(
                          title: translate(LocalizationKeys.submit)!,
                          onPressed: () {
                            BlocProvider.of<SetAccountBloc>(context).add(
                                ValidateSetAccountFormEvent(formKey: formKey));
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

  void _openHomeScreen(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
  }

  void _submitSetAccount(BuildContext context) {
    BlocProvider.of<SetAccountBloc>(context)
        .add(SubmitSetAccountEvent(username: userName!));
  }
}
