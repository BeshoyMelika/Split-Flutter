import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/res/app_asset_paths.dart';
import 'package:split/res/app_colors.dart';

// ignore: must_be_immutable
class AuthBase extends BaseStatelessWidget {
  AuthBase({super.key, required this.body});
  final Widget body;

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height.h,
          width: width.w,
          child: Stack(
            children: [
              SizedBox(
                height: height.h,
                width: width.w,
                child: Image.asset(
                  AppAssetPaths.splashScreenBackground,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Expanded(child: SvgPicture.asset(AppAssetPaths.splitLogo)),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: height.h * 2.2 / 3,
                    ),
                    child: SingleChildScrollView(child: body),
                  ),
                ],
              ),
              if (Navigator.of(context).canPop())
                PositionedDirectional(
                  top: 50.h,
                  start: 8.w,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.arrowBack,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
