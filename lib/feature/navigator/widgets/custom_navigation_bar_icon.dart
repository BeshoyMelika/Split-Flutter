// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/navigator/data/user_model.dart';
import 'package:split/feature/navigator/widgets/network_image_bloc/network_image_bloc.dart';
import 'package:split/feature/widgets/app_loading_skeleton_container.dart';
import 'package:split/res/app_icons.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/widgets/app_cached_network_image.dart';

/// This Class is Used to make Icons in BottomNavigationBar
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
    Icons.person_outlined,
    AppIcons.activityIcon,
  ];

  @override
  Widget baseBuild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.sp),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: _showIconOrAccountImage(context),
          ),
          Expanded(
            flex: 1,
            child: Text(name,
                style: textTheme.bodyLarge!.copyWith(
                  color: _getCurrentIconColor(),
                )),
          ),
        ],
      ),
    );
  }

  /// ////////////////////////////////////////////////////////
  /// ///////////////// Widget methods ///////////////////////
  /// ////////////////////////////////////////////////////////
  Widget accountPhoto(BuildContext context) {
    return BlocProvider(
      create: (_) => NetworkImageBloc()..add(GetAccountImageEvent()),
      child: BlocBuilder<NetworkImageBloc, NetworkImageState>(
        builder: (context, state) {
          if (state is NetworkImageLoadedState) {
            return Container(
                width: 24.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.r)),
                    border: Border.all(color: _getCurrentIconColor()),
                    image: const DecorationImage(
                        image: AppCachedNetworkImageProvider(
                            imageUrl: UserDataModel.userProfileImage))));
          } else if (state is NetworkImageLoadingState) {
            return AppLoadingSkeletonContainer.circular(
                width: 24.w, height: 50.h);
          } else if (state is NetworkImageNotFoundState) {
            return const Center(child: Icon(Icons.account_circle_rounded));
          }
          return Container();
        },
      ),
    );
  }

  Widget _showIconOrAccountImage(BuildContext context) {
    // this widget wil show the icon widget until the index is lower than  3 then
    // it will show the account widget
    return iconIndex < 3
        ? Container(
            // this to handle the space for floatingActionButton
            padding: iconIndex == 1 || iconIndex == 2
                ? EdgeInsets.symmetric(horizontal: 35.w)
                : null,
            child: Icon(iconList[iconIndex % iconList.length],
                color: _getCurrentIconColor()),
          )
        : accountPhoto(context);
  }

  /// ////////////////////////////////////////////////////////
  /// ///////////////// Helper methods ///////////////////////
  /// ////////////////////////////////////////////////////////
  bool _checkCurrentSelected() => selectedIconIndex == iconIndex ? true : false;
  Color _getCurrentIconColor() => _checkCurrentSelected()
      ? AppColors.selectedNavBarIcon
      : AppColors.unSelectedNavBarIcon;
}
