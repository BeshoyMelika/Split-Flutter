import 'package:flutter/material.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

//ignore: must_be_immutable
class DontReceiveCodeTextWidget extends BaseStatelessWidget {
  DontReceiveCodeTextWidget({
    super.key,
  });

  @override
  Widget baseBuild(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          translate(LocalizationKeys.didNotReceiveACode)!,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            translate(LocalizationKeys.requestAgain)!,
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
}
