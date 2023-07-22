// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/navigator/navigator_bloc/navigator_bloc.dart';
import 'package:split/feature/navigator/navigator_bloc/navigator_state.dart';
import 'package:split/feature/navigator/navigator_screen_list.dart';
import 'package:split/feature/navigator/widgets/custom_bottom_navigation_bar.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/res/app_icons.dart';

class AppNavigatorScreen extends BaseStatelessWidget {
  AppNavigatorScreen({Key? key}) : super(key: key);

  @override
  Widget baseBuild(BuildContext context) {
    int currentScreen = 0;
    return BlocProvider(
      create: (context) => NavigatorBloc(),
      child: BlocBuilder<NavigatorBloc, NavigatorBlocSates>(
        builder: (context, state) {
          if (state is NavigateToGroupScreenState) {
            currentScreen = 0;
          } else if (state is NavigateToFriendsScreenState) {
            currentScreen = 1;
            //
          } else if (state is NavigateToActivityScreenState) {
            currentScreen = 2;

            //
          } else if (state is NavigateToProfileScreenState) {
            currentScreen = 3;
          }
          return AppNavScreenBlocProvider(currentScreen: currentScreen);
        },
      ),
    );
  }
}

class AppNavScreenBlocProvider extends StatelessWidget {
  final int currentScreen;
  const AppNavScreenBlocProvider({Key? key, required this.currentScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: currentScreen,
          children: navigatorScreenList,
        ),

        //fab
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: EdgeInsets.all(3.r),
          child: FloatingActionButton(
            elevation: 0,
            onPressed: () {},
            backgroundColor: AppColors.floatingactionButtonLightMode,
            child: const Center(child: Icon(AppIcons.page)),
          ),
        ),

        // bottomNavBar
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
