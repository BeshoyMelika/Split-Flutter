import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/auth_bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:split/feature/auth/screens/sign_in_screen.dart';
import 'package:split/feature/auth/widgets/sign_up_widget.dart';
import 'package:split/feature/home/screen/home_screen.dart';

class SignUpScreen extends BaseStatefulScreenWidget {
  const SignUpScreen({super.key});
  static const routeName = 'signUpScreen';

  @override
  BaseScreenState<SignUpScreen> createState() => _SignUpScreenState();

  @override
  BaseScreenState<BaseStatefulScreenWidget> baseScreenCreateState() {
    // TODO: implement baseScreenCreateState
    throw UnimplementedError();
  }
}

class _SignUpScreenState extends BaseScreenState<SignUpScreen> {
  @override
  Widget baseBuild(BuildContext context) {
    return const AuthBase(body: SignUpWidget());
  }

  @override
  Widget baseScreenBuild(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          showLoading();
        } else if (state is SignUpFail) {
          hideLoading();
        } else if (state is SignUpSuccess) {
          hideLoading();
        }
      },
      builder: (context, state) {
        if (state is SignUpSuccess) {
          return const HomeScreen();
        } else if (state is ViewSignInScreen) {
          return const SignInScreen();
        } else {
          return const AuthBase(body: SignUpWidget());
        }
      },
    );
  }
}
