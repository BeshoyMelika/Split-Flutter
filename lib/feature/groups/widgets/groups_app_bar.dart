import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/res/app_colors.dart';

// ignore: must_be_immutable
class GroupsAppBar extends BaseStatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size(0.0, 59.h);
  GroupsAppBar(
      {required this.titleLocalizationsKey, Key? key, required this.showAction})
      : super(key: key);
  final String titleLocalizationsKey;
  final bool showAction;
  @override
  Widget baseBuild(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBarBackground,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r))),

      actions: showAction == false
          ? appBarActionsList(context)
          : null, //this will appearers only when the groups lists is empty

      title: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Text(translate(titleLocalizationsKey)!,
            style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: AppColors.appBarTextColor)),
      ),
    );
  }

  /// ////////////////////////////////////////////////////////////////////////////////
  /// ////////////////////////////// Widgets Methods//////////////////////////////////
  /// ////////////////////////////////////////////////////////////////////////////////
  ///
  List<Widget> appBarActionsList(BuildContext context) {
    return const [
      IconButton(
          onPressed: null,
          //this will move to search but I don't know the design
          //so I disable it
          // showSearch(context: context, delegate: CustomSearchDelegate()),
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
          )),
    ];
  }
}
