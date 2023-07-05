import 'package:flutter/material.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/widgets/reset_password_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});
  static const routeName = 'resetPasswordScreen';
  @override
  Widget build(BuildContext context) {
    return const AuthBase(body: ResetPasswordWidget());
  }
}
