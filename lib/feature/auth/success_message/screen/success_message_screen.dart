import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/constants.dart';
import 'package:split/feature/auth/sign_in/screen/sign_in_screen.dart';
import 'package:split/feature/auth/success_message/bloc/success_message_bloc.dart';
import 'package:split/feature/auth/success_message/widgets/success_message_body_widget.dart';

enum ScreenBeforeCongrats { resetPasswordScreen, otpScreen }

class SuccessMessageScreen extends StatelessWidget {
  const SuccessMessageScreen({super.key});
  static const routeName = 'successMessageScreen';

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    debugPrint(arguments.toString());
    return BlocProvider(
      create: (context) => SuccessMessageBloc(),
      child: SuccessMessageScreenWithBloc(
        screenBeforeCongrats: arguments[kScreenBeforeCongrats],
      ),
    );
  }
}

class SuccessMessageScreenWithBloc extends BaseStatefulScreenWidget {
  const SuccessMessageScreenWithBloc({
    super.key,
    required this.screenBeforeCongrats,
  });
  final ScreenBeforeCongrats screenBeforeCongrats;
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
        if (state is OpenLoginScreenLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is OpenLoginScreenSuccessState) {
          _openSignInScreen(context);
        }
      },
      builder: (context, state) {
        return AuthBase(
          body: SuccessMessageBodyWidget(
            screenBeforeCongrats: widget.screenBeforeCongrats,
          ),
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
