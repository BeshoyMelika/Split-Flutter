import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateful_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:split/res/app_asset_paths.dart';

class AddPhotoWidget extends BaseStatefulWidget {
  const AddPhotoWidget({Key? key}) : super(key: key);

  @override
  BaseState<AddPhotoWidget> baseCreateState() => _AddPhotoWidgetState();
}

class _AddPhotoWidgetState extends BaseState<AddPhotoWidget> {
  @override
  Widget baseBuild(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: SizedBox(
          width: 100.w,
          height: 82.h,
          child: SvgPicture.asset(
            AppAssetPaths.addPhoto,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
