import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateful_widget.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/res/app_colors.dart';

class TextFormFieldCustoms extends BaseStatefulWidget {
  const TextFormFieldCustoms({Key? key}) : super(key: key);

  @override
  BaseState<TextFormFieldCustoms> baseCreateState() =>
      _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends BaseState<TextFormFieldCustoms> {
  @override
  Widget baseBuild(BuildContext context) {
    return const Placeholder();
  }
}

// ignore: must_be_immutable
class TextFormFieldCustom extends BaseStatelessWidget {
  final String hintText;
  final String? confirmPassword;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool secureText;
  final bool? showCursor;
  final int? maxLines;
  final bool? preventSpaces;
  final void Function(String?) onChange;
  TextFormFieldCustom({
    Key? key,
    required this.hintText,
    required this.onChange,
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
      style: textTheme.bodyMedium!
          .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
      textInputAction: textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: (value) {
        onChange(value);
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
      errorBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.homeScreenTextFormFieldErrorBorder),
        // borderRadius: BorderRadius.circular(15.r),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.homeScreenTextFormFieldFocusBorder),
        //borderRadius: BorderRadius.circular(15.r),
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
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.homeScreenTextFormFieldFilled),
        //  borderRadius: BorderRadius.circular(15.r),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.homeScreenTextFormFieldErrorBorder),
        //  borderRadius: BorderRadius.circular(15.r),
      ),
    );
  }
}
