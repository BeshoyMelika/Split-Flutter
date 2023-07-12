import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/res/app_colors.dart';

// ignore: must_be_immutable
class GroupsAppBar extends BaseStatelessWidget implements PreferredSizeWidget {
  GroupsAppBar(
      {required this.titleLocalizationsKey, Key? key, required this.showAction})
      : super(key: key);
  final String titleLocalizationsKey;
  final bool showAction;
  @override
  Widget baseBuild(BuildContext context) {
    return AppBar(
      // foregroundColor: Colors.black,
      backgroundColor: AppColors.appBarBackground,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r))),
      actions: showAction == false
          ? const [
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.search_sharp,
                    weight: 900,
                    size: 30,
                    color: AppColors.appBarIcon,
                  )),
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.add,
                    weight: 900,
                    size: 30,
                    color: AppColors.appBarIcon,
                  ))
            ]
          : null,
      title: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Text(translate(titleLocalizationsKey)!,
            //  textAlign:  Alignment.center,
            style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: AppColors.appBarTextColor)),
      ),
    );
  }

  @override
  Size get preferredSize => Size(0.0, 59.h);

  /// ////////////////////////////////////////////////////////////////////////////////
  /// //////////////////////////////Helper Widgets////////////////////////////////////
  /// ////////////////////////////////////////////////////////////////////////////////
}
