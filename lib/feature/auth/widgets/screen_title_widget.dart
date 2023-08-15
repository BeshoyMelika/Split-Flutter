import 'package:flutter/material.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';

// ignore: must_be_immutable
class ScreenTitleWidget extends BaseStatelessWidget {
  ScreenTitleWidget({super.key, required this.titleLocalizationKey});
  final String titleLocalizationKey;
  @override
  Widget baseBuild(BuildContext context) {
    return Text(
      translate(titleLocalizationKey)!,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 27,
            fontWeight: FontWeight.w700,
          ),
    );
  }
}
