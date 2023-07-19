import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/widgets/app_text_widget.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

// ignore: must_be_immutable
class SpentReceivableWidget extends BaseStatelessWidget {
  SpentReceivableWidget(
      {required this.spentAmount, required this.receivableAmount, Key? key})
      : super(key: key);
  final double spentAmount;
  final double receivableAmount;
  @override
  Widget baseBuild(BuildContext context) {
    return SizedBox(
      height: 47.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _column(
              translate(LocalizationKeys.spent)!,
              500,
              textTheme.bodyMedium!
                  .copyWith(fontSize: 20.spMax, fontWeight: FontWeight.w600)),
          _column(
            translate(LocalizationKeys.receivable)!,
            500,
            TextStyle(
                color: AppColors.expenseDetailsScreenReceivableAmountText,
                fontSize: 20.spMax,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  /// /////////////////////////////////////////////////////////////
  /// ///////////////////////Helper Widgets////////////////////////
  /// /////////////////////////////////////////////////////////////

  Widget _column(String text, double amountOfMoney, TextStyle style) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: AppTextWidget(
              text: text,
              style: textTheme.bodyMedium!
                  .copyWith(fontSize: 14.spMax, fontWeight: FontWeight.w600),
            ),
          ),
          Flexible(
            child: AppTextWidget(
              text: "$amountOfMoney",
              style: style,
            ),
          ),
        ],
      );
}
