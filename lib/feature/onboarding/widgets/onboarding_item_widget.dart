import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';

// ignore: must_be_immutable
class OnBoardingItemWidget extends BaseStatelessWidget {
  OnBoardingItemWidget(
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
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        children: [
          SizedBox(height: 121.h),
          SizedBox(
            height: 300.h,
            width: 300.w,
            child: Image.network(
              imagePath,
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
      ),
    );
  }
}

enum OnBoardingItemWidgetIndex {
  firstPage,
  secondPage,
  thirdPage,
}
