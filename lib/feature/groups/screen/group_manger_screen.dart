// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/groups/data/repositories/demy_group_data_repo.dart';
import 'package:split/feature/groups/widgets/groups_app_bar.dart';
import 'package:split/feature/groups/bloc/groups_manger_bloc.dart';
import 'package:split/feature/groups/data/models/group_item_data.dart';
import 'package:split/feature/groups/widgets/group_item_view.dart';
import 'package:split/res/app_asset_paths.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

class GroupsMangerScreen extends BaseStatelessWidget {
  GroupsMangerScreen({super.key});
  List<GroupItemDate> currentAllGroupsList = [];
  List<GroupItemDate> currentPinnedGroupsList = [];
  @override
  Widget baseBuild(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    DemyGroupsDataRepo dataRepo = DemyGroupsDataRepo();
    return BlocProvider(
      create: (_) => GroupsMangerBloc(dataRepo)..add(GetGroupsDataEvent()),
      child: BlocConsumer<GroupsMangerBloc, GroupsMangerState>(
        listener: (context, state) {
          if (state is AllGroupsListLoadingState) {
            const CircularProgressIndicator();
          }
          if (state is AllGroupsListLoadedState) {
            currentAllGroupsList = state.allGroupsList;
            currentPinnedGroupsList = state.pinnedGroupsList;
          }
          if (state is GroupsListLoadingFailedState) {
            showDialog(
                context: context,
                builder: (context) => AboutDialog(children: [
                      Center(
                        child: Text(state.filedMsg),
                      )
                    ]));
          }
        },
        builder: (context, state) {
          if (state is AllGroupsListLoadedState) {
            return pinnedAndAllGroupsListWidget(
                scrollController, state, context);
          } else if (currentAllGroupsList.isEmpty &&
              currentPinnedGroupsList.isEmpty) {
            emptyGroupsListScreen(context);
          }
          return Container();
        },
      ),
    );
  }

  /// ////////////////////////////////////////////////////////
  /// ///////////////// Widget methods ///////////////////////
  /// ////////////////////////////////////////////////////////
  Widget pinnedAndAllGroupsListWidget(ScrollController scrollController,
      AllGroupsListLoadedState state, BuildContext context) {
    return Scaffold(
        appBar: GroupsAppBar(
            titleLocalizationsKey: LocalizationKeys.groups, showAction: false),
        body: Container(
          padding: EdgeInsets.fromLTRB(25.w, 10.h, 15.w, 0),
          height: double.infinity,
          // this to scroll in the   all screen
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  translate(LocalizationKeys.quickAccess)!,
                  style: textTheme.titleSmall!.copyWith(fontSize: 17.sp),
                ),
// first list for quick access
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: currentPinnedGroupsList.length,
                  itemBuilder: (context, index) {
                    GroupItemDate groupItemDate =
                        currentPinnedGroupsList[index];
                    return GroupItemView(groupItemDate: groupItemDate);
                  },
                ),

                SizedBox(height: 10.h),
/////all group list
                Text(
                  translate(LocalizationKeys.allGroups)!,
                  style: textTheme.titleSmall!.copyWith(fontSize: 17.sp),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: currentAllGroupsList.length,
                  itemBuilder: (context, index) {
                    GroupItemDate groupItemDate = currentAllGroupsList[index];
                    return GroupItemView(groupItemDate: groupItemDate);
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Widget emptyGroupsListScreen(BuildContext context) {
    return Scaffold(
      appBar: GroupsAppBar(
          showAction: true, titleLocalizationsKey: LocalizationKeys.groups),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 150.h),
            SvgPicture.asset(
              AppAssetPaths.emptyGroupBackground,
              height: 242.h,
              width: 200.w,
            ),
            SizedBox(height: 30.h),
            Text(translate(LocalizationKeys.youDonNotHaveAnyGroupStatement)!,
                style: textTheme.headlineMedium!
                    .copyWith(color: AppColors.emptyGroupScreenText)),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                child: Text(translate(LocalizationKeys.createGroupNow)!,
                    style: textTheme.headlineMedium!
                        .copyWith(color: AppColors.emptyGroupScreenText))),
            SizedBox(height: 30.h),
            GestureDetector(
                child: Container(
                    height: 50.h,
                    margin: EdgeInsets.symmetric(horizontal: 100.w),
                    decoration: BoxDecoration(
                        color: AppColors.emptyGroupButton,
                        borderRadius: BorderRadius.all(Radius.circular(10.r))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person_add_alt,
                          color: AppColors.appBarIcon,
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          translate(LocalizationKeys.createNewGroup)!,
                          style: textTheme.titleMedium!
                              .copyWith(color: AppColors.emptyGroupIconButton),
                        ),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }

  /// ////////////////////////////////////////////////////////
  /// ///////////////// Helper methods ///////////////////////
  /// ////////////////////////////////////////////////////////

  GroupsMangerBloc currentBloc(BuildContext context) =>
      context.read<GroupsMangerBloc>();
}
