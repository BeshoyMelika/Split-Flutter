import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/auth_bloc/otp_verification_bloc/otp_verification_bloc.dart';
import 'package:split/feature/auth/screens/success_message_screen.dart';
import 'package:split/feature/auth/widgets/otp_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});
  static const routName = 'otpScreen';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpVerificationBloc, OtpVerificationState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is OtpVerifySuccessState) {
          return const SuccessMessageScreen();
        } else {
          return const AuthBase(body: OTPWidget());
        }
      },
    );
  }
}
