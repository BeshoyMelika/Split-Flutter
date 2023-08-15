import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

// ignore: must_be_immutable
class CheckAgreeRowWidget extends BaseStatelessWidget {
  CheckAgreeRowWidget({super.key, required this.state});
  final SignUpState state;
  @override
  Widget baseBuild(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            _changeCheckIconEvent(context);
          },
          child: state is CheckAgreeState
              ? const Icon(
                  Icons.check_box,
                  size: 20,
                  color: AppColors.checkAgreeIcon,
                )
              : const Icon(
                  Icons.check_box_outline_blank_sharp,
                  size: 20,
                  color: AppColors.checkAgreeIcon,
                ),
        ),
        SizedBox(width: 5.w),
        Text(
          translate(LocalizationKeys.iAgreeToAll)!,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
        ),
        Text(
          translate(LocalizationKeys.termsAndConditions)!,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textOfTermsCondition,
          ),
        ),
      ],
    );
  }

  /// /////////////////////////////////////////////////////////////////////////
  /// ////////////////////// helper methods ///////////////////////////////////
  /// /////////////////////////////////////////////////////////////////////////

  void _changeCheckIconEvent(BuildContext context) {
    BlocProvider.of<SignUpBloc>(context).add(ChangeCheckIconEvent());
  }
}
