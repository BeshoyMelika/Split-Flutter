import 'package:flutter/material.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';

// ignore: must_be_immutable
class ScreenDescriptionWidget extends BaseStatelessWidget {
  ScreenDescriptionWidget({super.key, required this.descriptionLocalizationKey});
  final String descriptionLocalizationKey;
  @override
  Widget baseBuild(BuildContext context) {
    return Text(
      translate(descriptionLocalizationKey)!,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
    );
  }
}
