import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/res/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          )),
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.appElevatedButton),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
