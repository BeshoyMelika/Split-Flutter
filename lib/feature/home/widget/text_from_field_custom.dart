import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/res/app_colors.dart';

// ignore: must_be_immutable
class TextFormFieldCustom extends BaseStatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextEditingController? confirmPassword;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool secureText;
  final bool? showCursor;
  final int? maxLines;
  final bool? preventSpaces;
  TextFormFieldCustom({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.textInputAction,
    required this.secureText,
    this.confirmPassword,
    this.showCursor,
    this.maxLines,
    required this.textInputType,
    this.preventSpaces,
  }) : super(key: key);

  @override
  Widget baseBuild(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: textTheme.bodyMedium!
          .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
      textInputAction: textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      showCursor: showCursor ?? true,
      keyboardType: textInputType,
      obscureText: secureText,
      maxLines: maxLines,
      //inputFormatters: [],
      decoration: inputDecorationForTextFormFields(hintText),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "value is empty";
        }
        return null;
      },
    );
  }

  InputDecoration inputDecorationForTextFormFields(String hintTxt) {
    return InputDecoration(
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            color: AppColors.homeScreenTextFormFieldErrorBorder),
        borderRadius: BorderRadius.circular(15.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            color: AppColors.homeScreenTextFormFieldFocusBorder),
        borderRadius: BorderRadius.circular(15.r),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      errorStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      hintText: hintTxt,
      hintStyle: const TextStyle(
          color: AppColors.homeScreenTextFormFieldHintText,
          fontSize: 16,
          fontWeight: FontWeight.w600),
      fillColor: AppColors.homeScreenTextFormFieldFilled,
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.homeScreenTextFormFieldFilled),
          borderRadius: BorderRadius.circular(15.r)),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            color: AppColors.homeScreenTextFormFieldErrorBorder, width: 1.5),
        borderRadius: BorderRadius.circular(15.r),
      ),
    );
  }
}
