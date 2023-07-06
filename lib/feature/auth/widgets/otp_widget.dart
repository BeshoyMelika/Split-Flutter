import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:split/feature/auth/auth_bloc/otp_verification_bloc/otp_verification_bloc.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/res/app_colors.dart';

class OTPWidget extends StatelessWidget {
  const OTPWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroundOfWidget,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: OtpForm(),
      ),
    );
  }
}

class OtpForm extends StatefulWidget {
  const OtpForm({
    super.key,
  });

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  int? pin1, pin2, pin3, pin4;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'OTP Verification',
            style: TextStyle(
              fontSize: 27.0,
              fontWeight: FontWeight.w700,
              color: AppColors.titleOfWidget,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'An 4 digits code has been sent to your number ending with *******444',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: AppColors.descriptionOfWidget,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Pinput(
              length: 4,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              defaultPinTheme: PinTheme(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: AppColors.backgroundOfOtp,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.otpBorder,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Expanded(
                  child: AppButton(
                title: 'Verify',
                onPressed: () {
                  BlocProvider.of<OtpVerificationBloc>(context)
                      .add(OtpVerifyEvent());
                },
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Didn’t receive a code?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textOfQuestion,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Request Again',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textButtonOfSignInOutRequestAgain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
