import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/widgets/app_text_widget.dart';
import 'package:split/res/app_colors.dart';

// ignore: must_be_immutable
class CreateGroupScreenListItem extends BaseStatelessWidget {
  CreateGroupScreenListItem(this.icon,
      {required this.text, required this.selected, Key? key})
      : super(key: key);
  CreateGroupScreenListItem.withIcon(
      {super.key,
      required this.icon,
      required this.text,
      required this.selected});
  final IconData? icon;
  final bool selected;
  final String text;
  @override
  Widget baseBuild(BuildContext context) {
    return Center(
      child: Card(
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          elevation: 3,
          color: selected
              ? AppColors.homeScreenTypeListCardSelected
              : AppColors.homeScreenTypeListCardUnSelected,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: icon == null
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  child: AppTextWidget(
                    alignment: AlignmentDirectional.center,
                    boxFit: BoxFit.scaleDown,
                    text: text,
                    style: selected
                        ? textTheme.titleLarge!
                            .copyWith(fontWeight: FontWeight.w600, fontSize: 16)
                        : textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                )
              : Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Icon(icon,
                            color: selected
                                ? AppColors.homeScreenTypeListIconsSelected
                                : AppColors.homeScreenTypeListIconsUnSelected),
                        SizedBox(width: 5.w),
                        AppTextWidget(
                          alignment: AlignmentDirectional.center,
                          boxFit: BoxFit.scaleDown,
                          text: text,
                          style: selected
                              ? textTheme.titleLarge!.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 16)
                              : textTheme.bodySmall!.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                )),
    );
  }
}
