import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/sign_in/screen/sign_in_screen.dart';
import 'package:split/feature/auth/success_message/bloc/success_message_bloc.dart';
import 'package:split/feature/auth/success_message/widgets/success_message_body_widget.dart';

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
        if (state is OpenLoginScreenSuccessState) {
          _openSignInScreen(context);
        } else if (state is OpenLoginScreenLoadingState) {
          showLoading();
        }
      },
      builder: (context, state) {
        return AuthBase(
          body: SuccessMessageBodyWidget(),
        );
      },
    );
  }

  /// /////////////////////////////////////////////////////////////////////////
  /// ////////////////////// helper methods ///////////////////////////////////
  /// /////////////////////////////////////////////////////////////////////////

  void _openSignInScreen(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(SignInScreen.routeName, (route) => false);
  }
}
