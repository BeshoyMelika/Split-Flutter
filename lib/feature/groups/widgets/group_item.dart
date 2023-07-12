// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/groups/bloc/groups_manger_bloc.dart';
import 'package:split/feature/groups/models/group_item_data.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/res/app_icons.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

class GroupItem extends BaseStatelessWidget {
  final GroupItemDate groupItemDate;
  final int index;
  GroupItem({super.key, required this.groupItemDate, required this.index});

  @override
  Widget baseBuild(BuildContext context) {
    //

    bool isPinned = BlocProvider.of<GroupsMangerBloc>(context)
        .quickAccessGroupsList
        .contains(groupItemDate);

    return BlocBuilder<GroupsMangerBloc, GroupsMangerState>(
      builder: (context, state) {
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
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: 4 > 3
                      ? Container(
                          color: const Color.fromARGB(0, 194, 14, 14),
                          height: 71,
                          width: 71,
                          // child: Image.network(
                          //     'https://cdn2.vectorstock.com/i/1000x1000/03/11/home-house-building-and-family-design-vector-10680311.jpg')
                        )
                      : const CircularProgressIndicator()),

              //
              groupTitleAndDetails(),

              /// the pin
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () =>
                      currentBloc(context).add(PinItemSwitcherEvent(index)),
                  icon: Icon(
                    Icons.push_pin_rounded,
                    color: isPinned == false
                        ? AppColors.groupItemIcon
                        : AppColors.groupItemPinedIcon,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  /// ////////////////////////////////////////////////////////
  /// ///////////////// Widget methods ///////////////////////
  /// ////////////////////////////////////////////////////////
  Widget groupTitleAndDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 220.w,
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
          child: Text(
            groupItemDate.groupName,
            maxLines: 1,
            style: textTheme.bodyLarge!
                .copyWith(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Icon(
            Icons.person,
            size: 20,
            color: AppColors.groupItemIcon,
          ),
          SizedBox(width: 5.w),

          ///
          Text(groupItemDate.friendsNumber.toString(),
              style: textTheme.bodyMedium!
                  .copyWith(color: AppColors.groupItemIcon)),
          SizedBox(width: 5.w),

          ///  friends Text
          Text(translate(LocalizationKeys.friends)!,
              style: textTheme.bodyMedium!
                  .copyWith(color: AppColors.groupItemIcon)),
        ]),

        /// second Row of expense
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Icon(
            AppIcons.expenses,
            size: 15,
            color: AppColors.groupItemIcon,
          ),
          SizedBox(width: 9.w),

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
}
