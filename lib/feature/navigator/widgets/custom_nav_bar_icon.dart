// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/navigator/widgets/bloc/account_photo_bloc.dart';
import 'package:split/res/app_icons.dart';

import '../../../res/app_colors.dart';

/// This Class is Used to make Icons in BottomNavigationBar
/// it takes string and int
class CustomNavigationBarIcon extends BaseStatelessWidget {
  /// this is the text used under the icon
  final String name;

  /// this variable is used to define which icon to show in the BottomNavigationBar
  final int iconIndex;

  /// this variable is used to define which icon to show in the BottomNavigationBar
  final int selectedIconIndex;

  CustomNavigationBarIcon(
      {Key? key,
      required this.name,
      required this.iconIndex,
      required this.selectedIconIndex})
      : super(key: key);

  ///this List contains all possible icons
  final List<dynamic> iconList = [
    Icons.people_alt_outlined,
    Icons.person,
    AppIcons.activityIcon,
  ];

  @override
  Widget baseBuild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: iconIndex < 3
                ? Icon(iconList[iconIndex % iconList.length],
                    color: _getCurrentIconColor())
                : accountPhoto(context),
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
  /// ///////////////// Widget methods ///////////////////////
  /// ////////////////////////////////////////////////////////
  Widget accountPhoto(BuildContext context) {
    return BlocProvider(
      create: (_) => AccountPhotoBloc()..add(GetAccountPhoto()),
      child: BlocBuilder<AccountPhotoBloc, AccountPhotoState>(
        builder: (context, state) {
          if (state is AccountPhotoLoadedState) {
            return Container(
                width: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.r)),
                    border: Border.all(color: _getCurrentIconColor()),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://image.lexica.art/full_jpg/7515495b-982d-44d2-9931-5a8bbbf27532'))));
          }
          if (state is AccountPhotoLoadingState) {
            return CircleAvatar(
              radius: 15.r,
              child: const CircularProgressIndicator(),
            );
          }
          if (state is AccountPhotoNotFoundState) {
            return const Icon(Icons.account_circle_rounded);
          }
          return Container();
        },
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
