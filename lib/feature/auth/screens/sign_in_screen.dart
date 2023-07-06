import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/auth_bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:split/feature/auth/screens/forget_password_screen.dart';
import 'package:split/feature/auth/screens/sign_up_screen.dart';
import 'package:split/feature/auth/widgets/sign_in_widget.dart';
import 'package:split/feature/home/screen/home_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  static const routeName = 'signInScreen';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SignInSuccessState) {
          return const HomeScreen();
        } else if (state is ForgetPasswordState) {
          return const ForgetPasswordScreen();
        } else if (state is SignUpScreenState) {
          return const SignUpScreen();
        } else {
          return const AuthBase(body: SignInWidget());
        }
      },
    );
  }
}
