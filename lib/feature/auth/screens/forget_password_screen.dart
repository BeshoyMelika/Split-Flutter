import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/auth_bloc/forget_password_bloc/forget_password_bloc.dart';
import 'package:split/feature/auth/screens/reset_password_screen.dart';
import 'package:split/feature/auth/widgets/forget_password_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});
  static const routeName = 'forgetPasswordScreen';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ResetPasswordSuccessState) {
          return const ResetPasswordScreen();
        } else {
          return const AuthBase(body: ForgetPasswordWidget());
        }
      },
    );
  }
}
