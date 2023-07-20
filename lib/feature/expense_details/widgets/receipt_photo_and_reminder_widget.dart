import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/expense_details/widgets/add_photo_receipt.dart';
import 'package:split/feature/widgets/app_text_widget.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/res/app_icons.dart';
import 'package:split/utils/format/app_date_format.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

//ignore:must_be_immutable
class ReceiptPhotoAndReminderWidget extends BaseStatelessWidget {
  ReceiptPhotoAndReminderWidget(
      {required this.onSendReminder,
      required this.onUploadImage,
      required this.dueDateForPay,
      Key? key})
      : super(key: key);
  final DateTime dueDateForPay;
  final VoidCallback onSendReminder;
  final void Function(File?) onUploadImage;
  @override
  Widget baseBuild(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: Card(
        color: AppColors.expenseDetailsScreenBodyCardsBackground,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(flex: 3, child: _dueDateAndSendReminder()),
              SizedBox(height: 32.h),
              Flexible(
                flex: 1,
                child: AppTextWidget(
                    text: translate(LocalizationKeys.receiptBillPhotos)!,
                    style: textTheme.bodyMedium!.copyWith(
                        fontSize: 16.spMax, fontWeight: FontWeight.w700)),
              ),
              SizedBox(height: 10.h),
              Flexible(
                flex: 4,
                child: AddPhotoReceipt(onUploadImage: onUploadImage),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// /////////////////////////////////////////////////////////////
  /// ///////////////////////Helper Widgets////////////////////////
  /// /////////////////////////////////////////////////////////////
  Widget _dueDateAndSendReminder() => SizedBox(
        height: 47.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: AppTextWidget(
                      text: translate(LocalizationKeys.dueDateForPay)!,
                      style: textTheme.bodyMedium!.copyWith(
                          fontSize: 14.spMax, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Flexible(
                    child: AppTextWidget(
                      text: _getFormattedDate(dueDateForPay),
                      style: textTheme.bodyMedium!.copyWith(
                          fontSize: 16.spMax, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 43.h,
                width: 155.w,
                child: ElevatedButton(
                    onPressed: onSendReminder,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors
                          .expenseDetailsScreenSendReminderButtonBackground,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(flex: 1, child: Icon(AppIcons.bell)),
                        Flexible(
                          flex: 4,
                          child: AppTextWidget(
                              text: translate(LocalizationKeys.sendReminder)!),
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      );

  /// /////////////////////////////////////////////////////////////
  /// ///////////////////////Helper Methods////////////////////////
  /// /////////////////////////////////////////////////////////////

  String _getFormattedDate(DateTime dueDateForPay) {
    String lastDate = AppDateFormat.formattingDateMonthDayYear(
        dueDateForPay, appLocale.locale.languageCode);
    return lastDate;
  }
}
