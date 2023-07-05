import 'package:flutter/material.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/widgets/success_message_widget.dart';

class SuccessMessageScreen extends StatelessWidget {
  const SuccessMessageScreen({super.key});
  static const routeName = 'successMessageScreen';
  @override
  Widget build(BuildContext context) {
    return const AuthBase(body: SuccessMessageWidget());
  }
}
