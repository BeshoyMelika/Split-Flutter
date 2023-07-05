import 'package:flutter/material.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/widgets/otp_widget.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});
  static const routName = 'otpScreen';
  @override
  Widget build(BuildContext context) {
    return const AuthBase(body: OTPWidget());
  }
}
