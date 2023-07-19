import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/res/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hint,
    this.maxLines = 1,
    required this.onSaved,
    this.secure = false,
    this.validator,
    required this.keyboardType,
    this.controller,
  });

  final String hint;
  final int maxLines;
  final void Function(String?) onSaved;
  final bool secure;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secure,
      onSaved: onSaved,
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
      decoration: InputDecoration(
        border: _buildBorder(),
        focusedBorder: _buildBorder(),
        enabledBorder: _buildBorder(),
        fillColor: AppColors.backgroundOfTextFormField,
        filled: true,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      ),
      maxLines: maxLines,
    );
  }

  /// /////////////////////////////////////////////////////////////////////////
  /// ////////////////////// helper methods ///////////////////////////////////
  /// /////////////////////////////////////////////////////////////////////////

  OutlineInputBorder _buildBorder([color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? AppColors.textFieldBorder),
    );
  }
}
