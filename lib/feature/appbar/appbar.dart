import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/widgets/custom_text.dart';
import 'package:split/res/app_colors.dart';

// ignore: must_be_immutable
class AppBarWidget extends BaseStatelessWidget {
  AppBarWidget({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  Widget baseBuild(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.generalAppBarBackground,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r))),
      leading: _backArrow(),
      title: CustomText(
          text: title,
          boxFit: BoxFit.scaleDown,
          alignment: Alignment.center,
          style: textTheme.titleLarge!
              .copyWith(fontWeight: FontWeight.w700, fontSize: 20)),
    );
  }

  /// ////////////////////////////////////////////////////////////////////////////////
  /// //////////////////////////////Helper Widgets////////////////////////////////////
  /// ////////////////////////////////////////////////////////////////////////////////
  Widget _backArrow() => IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.arrow_back,
        weight: 900,
        size: 30,
        color: AppColors.appBarIcon,
      ));
}
