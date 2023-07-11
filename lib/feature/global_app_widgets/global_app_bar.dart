import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/res/app_colors.dart';

// ignore: must_be_immutable
class GlobalAppBar extends BaseStatelessWidget implements PreferredSizeWidget {
  GlobalAppBar({required this.title, Key? key, required this.emptyGroupList})
      : super(key: key);
  final String title;
  final bool emptyGroupList;
  @override
  Widget baseBuild(BuildContext context) {
    return AppBar(
      // foregroundColor: Colors.black,
      backgroundColor: AppColors.appBarBackground,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r))),
      actions: emptyGroupList == false
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
      title: Text(translate(title) ?? title,
          //  textAlign:  Alignment.center,
          style: textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: AppColors.appBarTextColor)),
    );
  }

  @override
  Size get preferredSize => Size(0.0, 59.h);

  /// ////////////////////////////////////////////////////////////////////////////////
  /// //////////////////////////////Helper Widgets////////////////////////////////////
  /// ////////////////////////////////////////////////////////////////////////////////
}
