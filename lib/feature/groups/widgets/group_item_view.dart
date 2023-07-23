// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/groups/bloc/groups_manger_bloc.dart';
import 'package:split/feature/groups/data/models/group_item_data.dart';
import 'package:split/feature/navigator/widgets/network_image_bloc/network_image_bloc.dart';
import 'package:split/feature/widgets/app_loading_skeleton_container.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/res/app_icons.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

class GroupItemView extends BaseStatelessWidget {
  final GroupItemDate groupItemDate;

  GroupItemView({super.key, required this.groupItemDate});

  @override
  Widget baseBuild(BuildContext context) {
    return Container(
      height: 91.h,
      width: 328.w,
      margin: EdgeInsets.fromLTRB(0, 5.h, 0, 5.h),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.groupItemBorder, width: .3),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.groupItemColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // this is the Group's image if it's exist otherwise  I will add default icon
          putGroupImageOrDefaultIcon(
              context), //why this don't need context Beshoy
          groupTitleAndDetails(context),

          /// the pin button
          BlocBuilder<GroupsMangerBloc, GroupsMangerState>(
            builder: (context, state) {
              return Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => _pinOrUnPinButtonPressed(context),
                  icon: Icon(
                    size: 20.r,
                    Icons.push_pin_sharp,
                    color: getPinIconColor(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  /// ////////////////////////////////////////////////////////
  /// ///////////////// Widget methods ///////////////////////
  /// ////////////////////////////////////////////////////////
  BlocProvider<NetworkImageBloc> putGroupImageOrDefaultIcon(
      BuildContext context) {
    return BlocProvider(
      create: (_) => NetworkImageBloc()..add(GetGroupImageEvent()),
      child: BlocBuilder<NetworkImageBloc, NetworkImageState>(
        builder: (context, state) {
          if (state is NetworkImageLoadedState) {
            return _imageHolder(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                          image: NetworkImage(
                            groupItemDate.imagePath,
                          ),
                          fit: BoxFit.cover))),
            );
            //
          } else if (state is NetworkImageLoadingState) {
            AppLoadingSkeletonContainer.rounded(width: 71.w, height: 71.h);
          } else if (state is NetworkImageNotFoundState) {
            return _imageHolder(
                child: const Center(child: Icon(Icons.groups_2)));
          }
          return _imageHolder(
              child: AppLoadingSkeletonContainer.rounded(
                  width: 71.w, height: 71.h));
        },
      ),
    );
  }

  Widget _imageHolder({required Widget child}) {
    return Container(
        height: 71.h,
        width: 71.w,
        margin: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.w),
        child: child);
  }

  Widget groupTitleAndDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 220.w,
          child: Text(
            groupItemDate.groupName,
            maxLines: 1,
            style: textTheme.titleSmall!.copyWith(fontSize: 17.sp),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Icon(
            Icons.person,
            size: 20.r,
            color: AppColors.groupItemIcon,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Text(groupItemDate.friendsNumber.toString(),
                style: textTheme.bodyMedium!
                    .copyWith(color: AppColors.groupItemIcon)),
          ),

          ///  friends Text
          Text(translate(LocalizationKeys.friends)!,
              style: textTheme.bodyMedium!
                  .copyWith(color: AppColors.groupItemIcon)),
        ]),
        SizedBox(height: 6.h),

        /// second Row of expense
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Icon(
            AppIcons.expenses,
            size: 16.r,
            color: AppColors.groupItemIcon,
          ),
          SizedBox(width: 11.w),

          ///
          Text(groupItemDate.expensesValue,
              style: textTheme.bodyMedium!
                  .copyWith(color: AppColors.groupItemIcon)),
          SizedBox(width: 5.w),

          ///  friends Text
          Text(translate(LocalizationKeys.expenses)!,
              style: textTheme.bodyMedium!
                  .copyWith(color: AppColors.groupItemIcon)),
        ]),
      ],
    );
  }

  /// ////////////////////////////////////////////////////////
  /// ///////////////// Helper methods ///////////////////////
  /// ////////////////////////////////////////////////////////

  GroupsMangerBloc currentBloc(BuildContext context) =>
      context.read<GroupsMangerBloc>();

  //
  _pinOrUnPinButtonPressed(BuildContext context) =>
      currentBloc(context)..add(PinGroupSwitcherEvent(groupItemDate));

  //
  getPinIconColor() => groupItemDate.isPinned
      ? AppColors.groupItemPinedIcon
      : AppColors.groupItemIcon;
}
