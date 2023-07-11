// ignore_for_file: must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/global_app_widgets/global_app_bar.dart';
import 'package:split/feature/groups/bloc/groups_manger_bloc.dart';
import 'package:split/feature/groups/models/group_item_data.dart';
import 'package:split/feature/groups/widgets/group_item.dart';
import 'package:split/res/app_asset_paths.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

class GroupsMangerScreen extends BaseStatelessWidget {
  GroupsMangerScreen({super.key});

  @override
  Widget baseBuild(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupsMangerBloc(),

      //
      child: BlocConsumer<GroupsMangerBloc, GroupsMangerState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AllGroupsListLoadedState) {
            return Scaffold(
                appBar: GlobalAppBar(
                    title: LocalizationKeys.groups, emptyGroupList: false),
                //
                // floatingActionButtonLocation:
                //     FloatingActionButtonLocation.centerDocked,
                //
                body: Container(
                  padding: EdgeInsets.fromLTRB(25.w, 10, 15.w, 0),
                  height: double.infinity,

                  // this to scroll in the   all screen
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          translate(LocalizationKeys.quickAccess)!,
                          style: textTheme.bodyLarge!.copyWith(fontSize: 18),
                        ),

                        // first list for quick access
                        Container(
                          height:
                              height * .13 * state.quickAccessGroupsList.length,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.quickAccessGroupsList.length,
                            itemBuilder: (context, index) {
                              GroupItemDate groupItemDate =
                                  state.quickAccessGroupsList[index];
                              return GroupItem(
                                  groupItemDate: groupItemDate, index: index);
                            },
                          ),
                        ),
                        const SizedBox(height: 10),

                        Text(
                          translate(LocalizationKeys.allGroups)!,
                          style: textTheme.bodyLarge!.copyWith(fontSize: 18),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .6,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.allGroupsList.length,
                            itemBuilder: (context, index) {
                              GroupItemDate groupItemDate =
                                  state.allGroupsList[index];
                              return GroupItem(
                                  groupItemDate: groupItemDate, index: index);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )

                //bottomNavigationBar: customBottomNavBar(context, state),
                );
          }
          // this is a temporary action  to start the block only
          // this will change wile fixing bug of hot start
          // because the bloc is working only when do hot reload
          return emptyScreen(context);
        },
      ),
    );
  }

  /// ////////////////////////////////////////////////////////
  /// ///////////////// Helper methods ///////////////////////
  /// ////////////////////////////////////////////////////////

  GroupsMangerBloc currentBloc(BuildContext context) =>
      context.read<GroupsMangerBloc>();

  /// ////////////////////////////////////////////////////////
  /// ///////////////// Widget methods ///////////////////////
  /// ////////////////////////////////////////////////////////
  Widget emptyScreen(BuildContext context) {
    return Scaffold(
      appBar:
          GlobalAppBar(emptyGroupList: true, title: LocalizationKeys.groups),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            SvgPicture.asset(
              AppAssetPaths.emptyGroupBackground,
              height: 242,
              width: 200,
            ),
            SizedBox(height: 20.h),
            Text(translate(LocalizationKeys.youDonNotHaveAnyGroupStatement)!),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Text(translate(LocalizationKeys.createGroupNow)!)),
            SizedBox(height: 30.h),
            GestureDetector(
                onTap: () => currentBloc(context).add(StartBlocEvent()),
                child: Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: const BoxDecoration(
                        color: AppColors.emptyGroupButton,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          translate(LocalizationKeys.createNewGroup)!,
                          style: textTheme.titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                        const Icon(
                          Icons.person_add,
                          color: AppColors.appBarIcon,
                        )
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
