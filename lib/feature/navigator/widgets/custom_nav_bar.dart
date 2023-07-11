// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';

import 'package:split/feature/navigator/navigator_bloc/navigator_bloc.dart';
import 'package:split/feature/navigator/navigator_bloc/navigator_event.dart';
import 'package:split/feature/navigator/navigator_bloc/navigator_state.dart';
import 'package:split/feature/navigator/widgets/custom_nav_bar_icon.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

class CustomNavBar extends BaseStatelessWidget {
  CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget baseBuild(BuildContext context) {
    int currentScreen = 0;
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 50,
        child: BlocBuilder<NavigatorBloc, NavigatorBlocSates>(
          builder: (context, state) {
            if (state is NavigateToGroupScreenState) {
              currentScreen = 0;
            } else if (state is NavigateToFriendsScreenState) {
              currentScreen = 1;
            } else if (state is NavigateToActivityScreenState) {
              currentScreen = 2;
            } else if (state is NavigateToProfileScreenState) {
              currentScreen = 3;
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  /// Group Icon
                  _navigationIconWidget(
                      LocalizationKeys.groups, 0, currentScreen, context),

                  /// friends Icon
                  _navigationIconWidget(
                      LocalizationKeys.friends, 1, currentScreen, context),
                  _navigationIconWidget(
                      LocalizationKeys.activity, 2, currentScreen, context),
                  _navigationIconWidget(
                      LocalizationKeys.account, 3, currentScreen, context)
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// ////////////////////////////////////////////////////////
  /// ///////////////// Widget methods ///////////////////////
  /// ////////////////////////////////////////////////////////
  Widget _navigationIconWidget(
      String name, int iconIndex, int currentScreen, BuildContext context) {
    return InkWell(
      onTap: () {
        if (iconIndex == 0) {
          _groupEventFired(context);
        } else if (iconIndex == 1) {
          _friendsEventFired(context);
        } else if (iconIndex == 2) {
          _activityEventFired(context);
        } else if (iconIndex == 3) {
          _accountEventFired(context);
        }
      },
      child: BottomNavigationBarCustomIconWidget(
          name: name, iconIndex: iconIndex, selectedIconIndex: currentScreen),
    );
  }

  /// ////////////////////////////////////////////////////////
  /// ///////////////// Helper methods ///////////////////////
  /// ////////////////////////////////////////////////////////

  NavigatorBloc currentBloc(BuildContext context) =>
      context.read<NavigatorBloc>();

  /// this is a list of fired events
  _groupEventFired(BuildContext context) =>
      currentBloc(context).add(NavigateToGroupScreenEvent());

  _friendsEventFired(BuildContext context) =>
      currentBloc(context).add(NavigateToFriendsScreenEvent());

  _activityEventFired(BuildContext context) =>
      currentBloc(context).add(NavigateToActivityScreenEvent());

  _accountEventFired(BuildContext context) =>
      currentBloc(context).add(NavigateToProfileScreenEvent());
}
