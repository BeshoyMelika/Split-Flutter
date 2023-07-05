import 'package:flutter/material.dart';
import 'package:split/res/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.appElevatedButton)),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: AppColors.appElevatedButtonTitle),
      ),
    );
  }
}
