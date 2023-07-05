import 'package:flutter/material.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/widgets/forget_password_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});
  static const routeName = 'forgetPasswordScreen';

  @override
  Widget build(BuildContext context) {
    return const AuthBase(body: ForgetPasswordWidget());
  }
}
