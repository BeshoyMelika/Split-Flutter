import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/widgets/custom_text.dart';

// ignore: must_be_immutable
class HomeElevatedButtonCustom extends BaseStatelessWidget {
  HomeElevatedButtonCustom(this.icon,
      {required this.text,
      required this.onPressed,
      required this.buttonColor,
      required this.buttonHeight,
      required this.buttonWidth,
      required this.alignment,
      Key? key})
      : super(key: key);
  HomeElevatedButtonCustom.withIcon({
    super.key,
    required this.icon,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.onPressed,
    required this.buttonColor,
    required this.alignment,
    required this.text,
  });
  final IconData? icon;
  final String text;
  final double buttonHeight;
  final double buttonWidth;
  final VoidCallback onPressed;
  final Color buttonColor;
  final AlignmentGeometry alignment;
  @override
  Widget baseBuild(BuildContext context) {
    return Align(
      alignment: alignment,
      child: SizedBox(
        height: buttonHeight,
        width: buttonWidth,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
            ),
            onPressed: () {
              debugPrint("button pressed");
            },
            child: icon == null
                ? Text(text)
                : Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: Row(
                      children: [
                        Expanded(child: Icon(icon)),
                        Expanded(
                          child: CustomText(
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
