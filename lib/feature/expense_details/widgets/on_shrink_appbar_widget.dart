import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/res/app_asset_paths.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/res/app_icons.dart';
import 'package:split/utils/widgets/empty_widgets.dart';

// ignore: must_be_immutable
class OnShrinkAppBarWidget extends BaseStatelessWidget {
  OnShrinkAppBarWidget(
      {required this.expenseIcon, required this.title, Key? key})
      : super(key: key);
  final IconData expenseIcon;
  final String title;
  @override
  Widget baseBuild(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.expenseDetailsScreenAppBarBackground,
        image: const DecorationImage(
          image: AssetImage(AppAssetPaths.shapes),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(child: _backArrow(context)),
          SizedBox(
            height: 50.w,
            width: 50.w,
            child: Card(
              elevation: 3,
              color: AppColors.expenseDetailsScreenAppBarFloatingCard,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
              child: Center(
                  child: Icon(
                expenseIcon,
                color: AppColors.expenseDetailsScreenAppBarFloatingCardIcon,
              )),
            ),
          ),
          Text(
            title,
            style: textTheme.titleLarge!
                .copyWith(fontWeight: FontWeight.w700, fontSize: 27.spMax),
          ),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: IconButton(
                onPressed: _onEditIconPressed,
                icon: const Icon(
                  AppIcons.edit,
                  weight: 900,
                  color: Colors.white,
                )),
          ),
        ],
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
      : getEmptyWidget();

  /// /////////////////////////////////////////////////////////////
  /// ///////////////////////Helper Methods////////////////////////
  /// /////////////////////////////////////////////////////////////
  void _onEditIconPressed() {
    debugPrint("Edit Icon Pressed");
  }
}
