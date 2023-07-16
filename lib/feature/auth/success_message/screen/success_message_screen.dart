import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/set_account/screen/set_account_screen.dart';
import 'package:split/feature/auth/success_message/bloc/success_message_bloc.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/feature/home/screen/home_screen.dart';
import 'package:split/res/app_asset_paths.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

bool source = true;

class SuccessMessageScreen extends StatelessWidget {
  const SuccessMessageScreen({super.key});
  static const routeName = 'successMessageScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SuccessMessageBloc(),
      child: const SuccessMessageScreenWithBloc(),
    );
  }
}

class SuccessMessageScreenWithBloc extends BaseStatefulScreenWidget {
  const SuccessMessageScreenWithBloc({super.key});

  @override
  BaseScreenState<SuccessMessageScreenWithBloc> baseScreenCreateState() =>
      _SuccessMessageScreenWithBlocState();
}

class _SuccessMessageScreenWithBlocState
    extends BaseScreenState<SuccessMessageScreenWithBloc> {
  @override
  Widget baseScreenBuild(BuildContext context) {
    return BlocConsumer<SuccessMessageBloc, SuccessMessageState>(
      listener: (context, state) {
        if (state is DoneSuccessState) {
          if (source == true) {
            _openHomeScreen(context);
          } else {
            _openSetAccountScreen(context);
          }
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
              padding: const EdgeInsetsDirectional.only(
                  start: 16, end: 16, top: 70, bottom: 24),
              child: Column(
                children: [
                  SvgPicture.asset(AppAssetPaths.checkMarkSuccess),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    translate(LocalizationKeys.congrats)!,
                    style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                      color: AppColors.titleOfWidget,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    source
                        ? translate(LocalizationKeys.resetPasswordSuccessfully)!
                        : translate(
                            LocalizationKeys.youHaveSuccessfullyRegistered)!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.descriptionOfWidget,
                    ),
                  ),
                  const SizedBox(
                    height: 72,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: AppButton(
                        title: translate(LocalizationKeys.done)!,
                        onPressed: () {
                          BlocProvider.of<SuccessMessageBloc>(context)
                              .add(DoneEvent());
                        },
                      )),
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

  void _openHomeScreen(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
  }

  void _openSetAccountScreen(BuildContext context) {
    Navigator.of(context).pushNamed(SetAccountScreen.routeName);
  }
}
