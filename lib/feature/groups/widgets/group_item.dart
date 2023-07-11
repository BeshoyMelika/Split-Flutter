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
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: 4 > 3
                      ? Container(
                          color: Colors.black,
                          height: 71,
                          width: 71,
                          // child: Image.network(
                          //     'data:image/png;base64,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'),
                        )
                      : const CircularProgressIndicator()),

              //
              thereTexts(),
              SizedBox(width: 105.w),

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
  Column thereTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
          child: Text(
            groupItemDate.groupName,
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
