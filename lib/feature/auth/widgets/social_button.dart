import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:split/res/app_colors.dart';

class SocialButton extends StatelessWidget {
  const SocialButton(
      {super.key, required this.title, required this.image, this.onPressed});
  final String title;
  final String image;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              )),
              backgroundColor: MaterialStateProperty.all<Color>(
                  AppColors.backgroundOfSocialButton)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  image,
                  width: 20.w,
                  height: 20.h,
                ),
                SizedBox(width: 10.w),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
