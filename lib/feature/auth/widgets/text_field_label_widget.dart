import 'package:flutter/material.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';

// ignore: must_be_immutable
class TextFieldLabelWidget extends BaseStatelessWidget {
  TextFieldLabelWidget({super.key, required this.labelLocalizationKey});
  final String labelLocalizationKey;
  @override
  Widget baseBuild(BuildContext context) {
    return Text(
      translate(labelLocalizationKey)!,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
