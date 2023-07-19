import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

//ignore: must_be_immutable
class ForgetPasswordTextButtonWidget extends BaseStatelessWidget {
  ForgetPasswordTextButtonWidget({
    super.key,
  });

  @override
  Widget baseBuild(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            _forgetPasswordEvent(context);
          },
          child: Text(
            translate(LocalizationKeys.forgetPassword)!,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }

  /// /////////////////////////////////////////////////////////////////////////
  /// ////////////////////// helper methods ///////////////////////////////////
  /// /////////////////////////////////////////////////////////////////////////

  void _forgetPasswordEvent(BuildContext context) {
    BlocProvider.of<SignInBloc>(context).add(ForgetPasswordEvent());
  }
}
