import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/widgets/app_text_widget.dart';
import 'package:split/res/app_colors.dart';

// ignore: must_be_immutable
class AppBarWidget extends BaseStatelessWidget implements PreferredSize {
  AppBarWidget({required this.title, Key? key}) : super(key: key);
  final String title;
  @override
  Widget baseBuild(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(0, 59.h),
      child: AppBar(
        backgroundColor: AppColors.generalAppBarBackground,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r))),
        leading: _backArrow(context),
        title: AppTextWidget(
            text: title,
            boxFit: BoxFit.scaleDown,
            alignment: Alignment.center,
            style: textTheme.titleLarge!
                .copyWith(fontWeight: FontWeight.w700, fontSize: 20)),
      ),
    );
  }

  /// ////////////////////////////////////////////////////////////////////////////////
  /// //////////////////////////////Helper Widgets////////////////////////////////////
  /// ////////////////////////////////////////////////////////////////////////////////
  Widget _backArrow(BuildContext context) => Navigator.canPop(context)
      ? IconButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            weight: 900,
            size: 30,
            color: AppColors.appBarIcon,
          ))
      : const SizedBox.shrink();

  @override
  Widget get child => AppBarWidget(title: title);

  @override
  Size get preferredSize => Size(0.0, 59.h);
}
