import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/widgets/app_text_widget.dart';
import 'package:split/res/app_colors.dart';

// ignore: must_be_immutable
class HomeElevatedButtonCustom extends BaseStatelessWidget {
  HomeElevatedButtonCustom(
      {required this.text,
      required this.onPressed,
      this.buttonColor,
      this.icon,
      this.textStyle,
      required this.buttonHeight,
      this.buttonWidth,
      required this.alignment,
      Key? key})
      : super(key: key);
  HomeElevatedButtonCustom.withIcon({
    super.key,
    required this.icon,
    required this.buttonHeight,
    this.buttonWidth,
    this.textStyle,
    required this.onPressed,
    this.buttonColor,
    required this.alignment,
    required this.text,
  });
  final IconData? icon;
  final String text;
  final TextStyle? textStyle;
  final double buttonHeight;
  final double? buttonWidth;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final AlignmentGeometry alignment;
  @override
  Widget baseBuild(BuildContext context) {
    return Align(
      alignment: alignment,
      child: SizedBox(
        height: buttonHeight,
        width: buttonWidth ?? width,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: buttonColor ?? AppColors.homeScreenButton,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
            ),
            onPressed: () {
              onPressed();
              debugPrint("button pressed");
            },
            child: icon == null
                ? AppTextWidget(
                    alignment: AlignmentDirectional.center,
                    boxFit: BoxFit.scaleDown,
                    text: text,
                    style: textStyle ??
                        textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 16))
                : Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: Row(
                      children: [
                        Expanded(child: Icon(icon)),
                        Expanded(
                          child: AppTextWidget(
                            alignment: AlignmentDirectional.center,
                            boxFit: BoxFit.scaleDown,
                            text: text,
                            style: textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  )),
      ),
    );
  }
}
