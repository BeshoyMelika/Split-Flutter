import 'package:flutter/material.dart';
import 'package:split/core/platform_manager.dart';
import 'package:split/core/screen_sizer.dart';
import 'package:split/core/themer.dart';
import 'package:split/core/translator.dart';

// ignore: must_be_immutable
abstract class BaseStatelessWidget extends StatelessWidget
    with Translator, ScreenSizer, PlatformManager, Themer {
  BaseStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initTranslator(context);
    initScreenSizer(context);
    initThemer(context);
    return baseBuild(context);
  }

  Widget baseBuild(BuildContext context);
}
