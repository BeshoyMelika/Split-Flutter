import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/widgets/custom_text.dart';
import 'package:split/res/app_colors.dart';

// ignore: must_be_immutable
class HomeScreenListItem extends BaseStatelessWidget {
  HomeScreenListItem(this.icon,
      {required this.text, required this.selected, Key? key})
      : super(key: key);
  HomeScreenListItem.withIcon(
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
                  child: CustomText(
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
                  child: Row(
                    children: [
                      Expanded(
                          child: Icon(icon,
                              color: selected
                                  ? AppColors.homeScreenTypeListIconsSelected
                                  : AppColors
                                      .homeScreenTypeListIconsUnSelected)),
                      Expanded(
                        child: CustomText(
                          alignment: AlignmentDirectional.center,
                          boxFit: BoxFit.scaleDown,
                          text: text,
                          style: selected
                              ? textTheme.titleLarge!.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 16)
                              : textTheme.bodySmall!.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                )),
    );
  }
}
