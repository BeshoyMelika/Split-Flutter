import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/auth_bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:split/feature/auth/screens/otp_screen.dart';
import 'package:split/feature/auth/screens/sign_in_screen.dart';
import 'package:split/feature/auth/widgets/sign_up_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const routeName = 'signUpScreen';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SignUpSuccessState) {
          return const OtpScreen();
        } else if (state is SignInScreenState) {
          return const SignInScreen();
        } else {
          return const AuthBase(body: SignUpWidget());
        }
      },
    );
  }
}
