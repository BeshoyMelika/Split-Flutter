import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/expense_details/models/split_person_ui_model.dart';
import 'package:split/feature/widgets/app_text_widget.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';
import 'package:split/utils/widgets/app_cached_network_image.dart';

//ignore:must_be_immutable
class SplitPersonItemWidget extends BaseStatelessWidget {
  SplitPersonItemWidget({required this.paymentDetails, Key? key})
      : super(key: key);
  final SplitPersonUIModel paymentDetails;
  @override
  Widget baseBuild(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        color: AppColors.expenseDetailsScreenBodyCardsBackground,
        child: Row(
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: AppCachedNetworkImage(
                  imageUrl: paymentDetails.imageURL,
                  boxFit: BoxFit.fill,
                  height: 40.w,
                  width: 40.w,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
                flex: 3,
                child: _titleWidget(
                    paymentDetails.name, paymentDetails.amountOfMoney)),
            const Spacer(),
            if (paymentDetails.paymentStatus) Flexible(child: _paymentStatus()),
            //   AppTextWidget(text: )
          ],
        ),
      ),
    );
  }

  /// /////////////////////////////////////////////////////////////
  /// ///////////////////////Helper Widgets////////////////////////
  /// /////////////////////////////////////////////////////////////
  Widget _titleWidget(String text, double amountOfMoney) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
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
              style: textTheme.bodyMedium!
                  .copyWith(fontSize: 14.spMax, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      );

  Widget _paymentStatus() => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Row(
          children: [
            Flexible(
                flex: 1,
                child: Icon(
                  Icons.check,
                  size: 14.spMax,
                  color: AppColors.expenseDetailsScreenPaymentPaidStatus,
                  weight: 400,
                )),
            SizedBox(width: 5.w),
            Flexible(
              flex: 2,
              child: AppTextWidget(
                boxFit: BoxFit.scaleDown,
                text: translate(LocalizationKeys.paid)!,
                style: TextStyle(
                    color: AppColors.expenseDetailsScreenPaymentPaidStatus,
                    fontSize: 14.spMax,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      );
}
