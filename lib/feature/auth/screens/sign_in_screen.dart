import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/auth_bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:split/feature/auth/screens/sign_up_screen.dart';
import 'package:split/feature/auth/widgets/sign_in_widget.dart';
import 'package:split/feature/home/screen/home_screen.dart';

class SignInScreen extends BaseStatefulScreenWidget {
  const SignInScreen({super.key});
  static const routeName = 'signInScreen';

  @override
  BaseScreenState<SignInScreen> createState() => _SignInScreenState();

  @override
  BaseScreenState<BaseStatefulScreenWidget> baseScreenCreateState() {
    // TODO: implement baseScreenCreateState
    throw UnimplementedError();
  }
}

class _SignInScreenState extends BaseScreenState<SignInScreen> {
  @override
  Widget baseScreenBuild(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInLoading) {
          showLoading();
        } else if (state is SignInFail) {
          hideLoading();
        } else if (state is SignInSuccess) {
          hideLoading();
        }
      },
      builder: (context, state) {
        if (state is SignInSuccess) {
          return const HomeScreen();
        } else if (state is ViewSignUpScreen) {
          return const SignUpScreen();
        } else {
          return const AuthBase(body: SignInWidget());
        }
      },
    );
  }
}
