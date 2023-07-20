import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/res/app_asset_paths.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/res/app_icons.dart';
import 'package:split/utils/format/app_date_format.dart';
import 'package:split/utils/locale/app_localization_keys.dart';
import 'package:split/utils/widgets/empty_widgets.dart';

// ignore: must_be_immutable
class LongAppBarWithFloatingCard extends BaseStatelessWidget {
  LongAppBarWithFloatingCard(
      {required this.expenseIcon,
      required this.title,
      required this.lastUpdate,
      Key? key})
      : super(key: key);
  final IconData expenseIcon;
  final String title;
  final DateTime lastUpdate;
  @override
  Widget baseBuild(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.expenseDetailsScreenAppBarBackground,
            image: const DecorationImage(
              image: AssetImage(AppAssetPaths.shapes),
              fit: BoxFit.cover,
            ),
          ),
          height: 220.h,
        ),
        Positioned(
          top: 30.h,
          left: 10,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: _backArrow(context)),
              Flexible(
                child: IconButton(
                    onPressed: _onEditIconPressed,
                    icon: const Icon(
                      AppIcons.edit,
                      weight: 900,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 98.h,
          child: Center(
            child: SizedBox(
              height: 80.w,
              width: 80.w,
              child: Card(
                elevation: 3,
                color: AppColors.expenseDetailsScreenAppBarFloatingCard,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                child: Center(
                    child: Icon(
                  size: 20.spMax,
                  weight: 400,
                  expenseIcon,
                  color: AppColors.expenseDetailsScreenAppBarFloatingCardIcon,
                )),
              ),
            ),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 60.h,
            child: Center(
                child: Text(
              title,
              style: textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 27.spMax),
            ))),
        Positioned(
            left: 0,
            right: 0,
            bottom: 35,
            child: Center(
                child: Text(
              "${translate(LocalizationKeys.lastUpdate)} ${_getFormattedDate(lastUpdate, context)}",
              style: textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 14.spMax),
            ))),
      ],
    );
  }

  /// ////////////////////////////////////////////////////////////////////////////////
  /// //////////////////////////////Helper Widgets////////////////////////////////////
  /// ////////////////////////////////////////////////////////////////////////////////
  Widget _backArrow(BuildContext context) => Navigator.canPop(context)
      ? IconButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            weight: 900,
            size: 30,
            color: AppColors.appBarIcon,
          ))
      : getEmptyWidget();

  /// /////////////////////////////////////////////////////////////
  /// ///////////////////////Helper Methods////////////////////////
  /// /////////////////////////////////////////////////////////////
  void _onEditIconPressed() {
    debugPrint("Edit Icon Pressed Long AppBar");
  }

  String _getFormattedDate(DateTime expenseDateTime, BuildContext context) {
    String lastDate = AppDateFormat.formattingDateDayMonthYear(
        expenseDateTime, appLocale.locale.languageCode);
    return lastDate;
  }
}
