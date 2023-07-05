import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/res/app_asset_paths.dart';

// ignore: must_be_immutable
class PageViewCustom extends BaseStatelessWidget {
  PageViewCustom({Key? key, required this.text, required this.imagePath})
      : super(key: key);
  final String text;
  final String imagePath;
  @override
  Widget baseBuild(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 275.h,
          width: 368.w,
          child: Image.network(AppAssetPaths.networkImageHold),
        ),
        SizedBox(height: 23.h),
        Text(
          text,
          style: textTheme.bodySmall!
              .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
