import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/auth_bloc/reset_password_bloc/reset_password_bloc.dart';
import 'package:split/feature/auth/screens/success_message_screen.dart';
import 'package:split/feature/auth/widgets/reset_password_widget.dart';
import 'package:split/feature/auth/widgets/success_message_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});
  static const routeName = 'resetPasswordScreen';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        if (state is SubmitPasswordSuccessState) {
          previous = true;
        }
      },
      builder: (context, state) {
        if (state is SubmitPasswordSuccessState) {
          return const SuccessMessageScreen();
        } else {
          return const AuthBase(body: ResetPasswordWidget());
        }
      },
    );
  }
}
