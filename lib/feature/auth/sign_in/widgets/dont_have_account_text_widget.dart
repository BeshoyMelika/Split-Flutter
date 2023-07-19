import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

//ignore: must_be_immutable
class DontHaveAccountWidget extends BaseStatelessWidget {
  DontHaveAccountWidget({
    super.key,
  });

  @override
  Widget baseBuild(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          translate(LocalizationKeys.doNotHaveAnAccount)!,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
        ),
        TextButton(
          onPressed: () {
            _signUpScreenEvent(context);
          },
          child: Text(
            translate(LocalizationKeys.signUp)!,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ],
    );
  }

  /// /////////////////////////////////////////////////////////////////////////
  /// ////////////////////// helper methods ///////////////////////////////////
  /// /////////////////////////////////////////////////////////////////////////

  void _signUpScreenEvent(BuildContext context) {
    BlocProvider.of<SignInBloc>(context).add(SignUpScreenEvent());
  }
}
