import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/res/app_asset_paths.dart';

// ignore: must_be_immutable
class PageViewCustom extends BaseStatelessWidget {
  PageViewCustom(
      {Key? key,
      required this.mainText,
      required this.subText,
      required this.imagePath})
      : super(key: key);
  final String mainText;
  final String subText;
  final String imagePath;
  @override
  Widget baseBuild(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 300.h,
          width: 300.w,
          child: Image.network(
            AppAssetPaths.networkImageHold,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 70.h),
        Text(
          mainText,
          style: textTheme.bodyLarge!
              .copyWith(fontWeight: FontWeight.w700, fontSize: 24),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 23.h),
        Text(
          subText,
          style: textTheme.bodyMedium!
              .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
