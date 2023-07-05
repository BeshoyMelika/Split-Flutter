import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      required this.boxFit,
      required this.alignment,
      required this.style})
      : super(key: key);
  final String text;
  final BoxFit boxFit;
  final AlignmentGeometry alignment;
  final TextStyle style;
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
