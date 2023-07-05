// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/res/app_asset_paths.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

class GroupsMangerScreen extends BaseStatelessWidget {
  GroupsMangerScreen({super.key});

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: emptyScreen(context));
  }

  /// ////////////////////////////////////////////////////////
  /// ///////////////// Widget methods ///////////////////////
  /// ////////////////////////////////////////////////////////
  Column emptyScreen(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          AppAssetPaths.emptyGroupBackground,
          height: 242,
          width: 200,
        ),
        Text(translate(LocalizationKeys.youDonNotHaveAnyGroupStatement)!),
        GestureDetector(
            onTap: null,
            child: Container(
                height: 50,
                color: AppColors.emptyGroupButton,
                child: Text(translate(
                    LocalizationKeys.youDonNotHaveAnyGroupStatement)!)))
      ],
    );
  }
}
