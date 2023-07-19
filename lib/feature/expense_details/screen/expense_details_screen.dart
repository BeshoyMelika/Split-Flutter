import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/expense_details/bloc/expense_details_screen_bloc.dart';
import 'package:split/feature/expense_details/models/expense_details_ui_model.dart';
import 'package:split/feature/expense_details/widgets/long_appbar_with_floating_card.dart';
import 'package:split/feature/expense_details/widgets/on_shrink_appbar_widget.dart';
import 'package:split/feature/expense_details/widgets/paid_by_whom_widget.dart';
import 'package:split/feature/expense_details/widgets/payment_details_widget.dart';
import 'package:split/feature/expense_details/widgets/receipt_photo_end_reminder_widget.dart';
import 'package:split/feature/expense_details/widgets/spent_receivable_widget.dart';
import 'package:split/feature/widgets/app_text_widget.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

class ExpenseDetailsScreen extends StatelessWidget {
  const ExpenseDetailsScreen({Key? key}) : super(key: key);
  static const routeName = "expenseDetailsScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpenseDetailsScreenBloc(),
      child: const ExpenseDetailsScreenWithBloc(),
    );
  }
}

class ExpenseDetailsScreenWithBloc extends BaseStatefulScreenWidget {
  const ExpenseDetailsScreenWithBloc({Key? key}) : super(key: key);

  @override
  BaseScreenState<ExpenseDetailsScreenWithBloc> baseScreenCreateState() =>
      _ExpenseDetailsScreenWithBlocState();
}

class _ExpenseDetailsScreenWithBlocState
    extends BaseScreenState<ExpenseDetailsScreenWithBloc> {
  ScrollController? _scrollController;
  bool lastStatus = true;
  double onShrinkHeight = 222.h;
  late ExpenseDetailsUIModel expenseDetails;
  bool initialized = false;
  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset.h > onShrinkHeight;
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() => _loadExpenseDetailsAPIEvent());
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget baseScreenBuild(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.expenseDetailsScreenBackground,
      body: BlocConsumer<ExpenseDetailsScreenBloc, ExpenseDetailsScreenState>(
        listener: (context, state) {
          if (state is LoadingState) {
            showLoading();
          } else {
            hideLoading();
          }
          if (state is LoadedExpenseDetailsSuccessfullyState) {
            expenseDetails = state.expenseDetails;
            initialized = true;
          }
        },
        buildWhen: (previous, current) {
          if (current is LoadedExpenseDetailsSuccessfullyState) return true;
          return false;
        },
        builder: (context, state) {
          return initialized
              ? RefreshIndicator(
                  onRefresh: _onRefresh,
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      _appBar(),
                      SliverToBoxAdapter(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: SpentReceivableWidget(
                          spentAmount: expenseDetails.amountSpent,
                          receivableAmount: expenseDetails.amountReceivable,
                        ),
                      )),
                      _space(height: 30.h),
                      SliverToBoxAdapter(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: PaidByWhomWidget(
                            imageURL: expenseDetails.paidByImageURL,
                            name: expenseDetails.paidBy),
                      )),
                      _space(height: 20.h),
                      _textSplitEquallyFor(),
                      _space(height: 10.h),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: expenseDetails.splitUpon.length,
                          (BuildContext context, int index) {
                            return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 10.h),
                                child: PaymentDetailsWidget(
                                    paymentDetails:
                                        expenseDetails.splitUpon[index]));
                          },
                        ),
                      ),
                      SliverToBoxAdapter(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 20.h),
                        child: ReceiptPhotoSSendReminderWidget(
                            dueDateForPay: expenseDetails.dueDateForPay),
                      )),
                    ],
                    //  )
                  ),
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }

  /// /////////////////////////////////////////////////////////////
  /// ///////////////////////Helper Widgets////////////////////////
  /// /////////////////////////////////////////////////////////////
  Widget _space({double? height, double? width}) =>
      SliverToBoxAdapter(child: SizedBox(height: height, width: width));

  Widget _appBar() => SliverAppBar(
        elevation: 0,
        backgroundColor: _isShrink
            ? AppColors.expenseDetailsScreenAppBarBackground
            : AppColors.expenseDetailsScreenBackground,
        pinned: true,
        expandedHeight: 310.h,
        toolbarHeight: 70.h,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        leading: const SizedBox.shrink(),
        leadingWidth: 0.w,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: LongAppBarWithFloatingCard(
              expenseIcon: expenseDetails.expenseIcon,
              title: expenseDetails.expenseTitle,
              lastUpdate: DateTime.now()),
        ),
        title: _isShrink
            ? OnShrinkAppBarWidget(
                expenseIcon: expenseDetails.expenseIcon,
                title: expenseDetails.expenseTitle)
            : const SizedBox.shrink(),
      );

  Widget _textSplitEquallyFor() => SliverToBoxAdapter(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: AppTextWidget(
            text: translate(LocalizationKeys.splitEquallyFor)!,
            style: textTheme.bodyMedium!
                .copyWith(fontWeight: FontWeight.w700, fontSize: 16.spMax),
          ),
        ),
      ));

  /// /////////////////////////////////////////////////////////////
  /// ///////////////////////Helper Methods////////////////////////
  /// /////////////////////////////////////////////////////////////
  ExpenseDetailsScreenBloc get currentBloc =>
      context.read<ExpenseDetailsScreenBloc>();
  Future<void> _onRefresh() async {
    _loadExpenseDetailsAPIEvent();
  }

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  void _loadExpenseDetailsAPIEvent() {
    currentBloc.add(GetExpenseDetailsAPIEvent());
  }
}
