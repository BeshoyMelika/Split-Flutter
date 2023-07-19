import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:split/core/widgets/base_stateful_widget.dart';
import 'package:split/feature/expense_details/bloc/expense_details_screen_bloc.dart';
import 'package:split/feature/expense_details/widgets/add_photo_receipt.dart';
import 'package:split/feature/widgets/app_text_widget.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/res/app_icons.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

class ReceiptPhotoSSendReminderWidget extends BaseStatefulWidget {
  const ReceiptPhotoSSendReminderWidget({required this.dueDateForPay, Key? key})
      : super(key: key);
  final DateTime dueDateForPay;
  @override
  BaseState<ReceiptPhotoSSendReminderWidget> baseCreateState() =>
      _ReceiptPhotoSSendReminderWidgetState();
}

class _ReceiptPhotoSSendReminderWidgetState
    extends BaseState<ReceiptPhotoSSendReminderWidget> {
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
              const Flexible(
                flex: 4,
                child: AddPhotoReceipt(),
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
                      text: _getFormattedDate(widget.dueDateForPay),
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
                    onPressed: _onSendReminder,
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
  String _getFormattedDate(DateTime expenseDateTime) {
    String currentLocale = Localizations.localeOf(context).languageCode;
    String lastDate =
        DateFormat("MMM d, yyy", currentLocale).format(expenseDateTime);
    return lastDate;
  }

  void _onSendReminder() {
    currentContext.add(SendReminderToAllUsersExpenseDetailsEvent());
  }

  ExpenseDetailsScreenBloc get currentContext => context.read();
}
