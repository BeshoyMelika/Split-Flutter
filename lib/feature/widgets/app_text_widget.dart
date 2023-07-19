import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  final String text;
  final BoxFit boxFit;
  final AlignmentGeometry alignment;
  final TextStyle? style;
  const AppTextWidget(
      {Key? key,
      required this.text,
      this.boxFit = BoxFit.scaleDown,
      this.alignment = AlignmentDirectional.center,
      this.style})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: boxFit,
      alignment: alignment,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
