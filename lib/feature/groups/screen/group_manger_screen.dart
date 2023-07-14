// ignore_for_file: must_be_immutable, sized_box_for_whitespace

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

  @override
  Widget baseBuild(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    DemyGroupsDataRepo dataRepo = DemyGroupsDataRepo();

    return BlocProvider(
      create: (_) => GroupsMangerBloc(dataRepo)..add(GetGroupsDataEvent()),
      child: BlocConsumer<GroupsMangerBloc, GroupsMangerState>(
        listener: (context, state) {
          if (state is AllGroupsListLoadingState) {
            const CircularProgressIndicator(
              value: 25,
            );
          }
        },
        //beshoy I don't know why this doesn't work
        buildWhen: (previous, current) {
          if (current is EmptyGroupsListState) {
            emptyScreen(context);
          }
          return true;
        },
        builder: (context, state) {
          if (state is AllGroupsListLoadedState) {
            //
            return pinnedAndAllGroupsListWidget(
                scrollController, state, context);
            //
          } else if (state is EmptyGroupsListState) {
            return emptyScreen(context);
          }

          return Container();
        },
      ),
    );
  }

  /// ////////////////////////////////////////////////////////
  /// ///////////////// Widget methods ///////////////////////
  /// ////////////////////////////////////////////////////////
  Scaffold pinnedAndAllGroupsListWidget(ScrollController scrollController,
      AllGroupsListLoadedState state, BuildContext context) {
    return Scaffold(
        appBar: GroupsAppBar(
            titleLocalizationsKey: LocalizationKeys.groups, showAction: false),
        body: Container(
          padding: EdgeInsets.fromLTRB(25.w, 10, 15.w, 0),
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
                  style: textTheme.bodyLarge!.copyWith(fontSize: 18),
                ),

// first list for quick access
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.pinnedGroupsList.length,
                  itemBuilder: (context, index) {
                    debugPrint(state.pinnedGroupsList.length.toString());
                    GroupItemDate groupItemDate = state.pinnedGroupsList[index];
                    return GroupItemView(groupItemDate: groupItemDate);
                  },
                ),

                const SizedBox(height: 10),
/////all group list
                Text(
                  translate(LocalizationKeys.allGroups)!,
                  style: textTheme.bodyLarge!.copyWith(fontSize: 18),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.allGroupsList.length,
                  itemBuilder: (context, index) {
                    debugPrint(state.allGroupsList.length.toString());
                    GroupItemDate groupItemDate = state.allGroupsList[index];
                    return GroupItemView(groupItemDate: groupItemDate);
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Widget emptyScreen(BuildContext context) {
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
              height: 242,
              width: 200,
            ),
            SizedBox(height: 30.h),
            Text(translate(LocalizationKeys.youDonNotHaveAnyGroupStatement)!,
                style: textTheme.headlineMedium),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                child: Text(translate(LocalizationKeys.createGroupNow)!,
                    style: textTheme.headlineMedium)),
            SizedBox(height: 30.h),
            GestureDetector(
                child: Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 120),
                    decoration: const BoxDecoration(
                        color: AppColors.emptyGroupButton,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person_add_alt,
                          color: AppColors.appBarIcon,
                        ),
                        const SizedBox(width: 15),
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
