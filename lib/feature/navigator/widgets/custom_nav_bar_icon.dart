// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/res/app_icons.dart';

import '../../../res/app_colors.dart';

/// This Class is Used to make Icons in BottomNavigationBar
/// it takes string and int
class BottomNavigationBarCustomIconWidget extends BaseStatelessWidget {
  /// this is the text used under the icon
  final String name;

  /// this variable is used to define which icon to show in the BottomNavigationBar
  final int iconIndex;

  /// this variable is used to define which icon to show in the BottomNavigationBar
  final int selectedIconIndex;

  BottomNavigationBarCustomIconWidget(
      {Key? key,
      required this.name,
      required this.iconIndex,
      required this.selectedIconIndex})
      : super(key: key);

  ///this List contains all possible icons
  final List<IconData> _iconList = const [
    Icons.people_alt_outlined,
    Icons.person,
    AppIcons.activityIcon,
    Icons.account_circle_sharp
  ];

  @override
  Widget baseBuild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              _iconList[iconIndex],
              color: _getCurrentIconColor(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              name,
              style: TextStyle(
                color: _getCurrentIconColor(),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// ////////////////////////////////////////////////////////
  /// ///////////////// Helper methods ///////////////////////
  /// ////////////////////////////////////////////////////////
  bool _checkCurrentSelected() => selectedIconIndex == iconIndex ? true : false;
  Color _getCurrentIconColor() => _checkCurrentSelected()
      ? AppColors.selectedNavBarIcon
      : AppColors.unSelectedNavBarIcon;
}
