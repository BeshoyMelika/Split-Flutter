import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';
import 'package:split/utils/widgets/app_cached_network_image.dart';

// ignore: must_be_immutable
class PaidByWhomWidget extends BaseStatelessWidget {
  PaidByWhomWidget({required this.imageURL, required this.name, Key? key})
      : super(key: key);
  final String imageURL;
  final String name;
  @override
  Widget baseBuild(BuildContext context) {
    return SizedBox(
      height: 75.h,
      child: Card(
        color: AppColors.expenseDetailsScreenBodyCardsBackground,
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: Row(children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: AppCachedNetworkImage(
                  imageUrl: imageURL,
                  boxFit: BoxFit.fill,
                  height: 40.w,
                  width: 40.w,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Flexible(
              child: Text(
                "${translate(LocalizationKeys.paidBy)} $name",
                style: textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 16.spMax),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
