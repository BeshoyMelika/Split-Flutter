import 'package:flutter/material.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';

// ignore: must_be_immutable
class ScreenDescriptionWidget extends BaseStatelessWidget {
  ScreenDescriptionWidget({
    super.key,
    required this.descriptionLocalizationKey,
    this.append,
  });
  final String descriptionLocalizationKey;
  final String? append;
  @override
  Widget baseBuild(BuildContext context) {
    return Text(
      '${translate(descriptionLocalizationKey)} ${append ?? ''}',
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
    );
  }
}
