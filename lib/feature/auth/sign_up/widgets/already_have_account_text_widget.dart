import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

//ignore: must_be_immutable
class AlreadyHaveAccountWidget extends BaseStatelessWidget {
  AlreadyHaveAccountWidget({
    super.key,
  });

  @override
  Widget baseBuild(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          translate(LocalizationKeys.alreadyHaveAnAccount)!,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
        ),
        TextButton(
          onPressed: () {
            _signInScreenEvent(context);
          },
          child: Text(
            translate(LocalizationKeys.login)!,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  /// /////////////////////////////////////////////////////////////////////////
  /// ////////////////////// helper methods ///////////////////////////////////
  /// /////////////////////////////////////////////////////////////////////////

  void _signInScreenEvent(BuildContext context) {
    BlocProvider.of<SignUpBloc>(context).add(SignInScreenEvent());
  }
}
