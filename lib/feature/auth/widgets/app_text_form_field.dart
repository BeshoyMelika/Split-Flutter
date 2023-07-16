import 'package:flutter/material.dart';
import 'package:split/res/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.secure = false,
      this.validator,
      this.keyboardType});

  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final bool secure;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secure,
      onSaved: onSaved,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textFieldBorder),
        ),
        fillColor: AppColors.backgroundOfTextFormField,
        filled: true,
        hintText: hint,
        hintStyle: const TextStyle(
          color: AppColors.hintText,
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
      ),
      maxLines: maxLines,
    );
  }
}
