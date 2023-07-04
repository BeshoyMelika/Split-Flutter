import 'package:flutter/material.dart';
import 'package:split/core/platform_manager.dart';
import 'package:split/core/screen_sizer.dart';
import 'package:split/core/themer.dart';
import 'package:split/core/translator.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  BaseState createState() => baseCreateState();

  BaseState baseCreateState();
}

abstract class BaseState<W extends BaseStatefulWidget> extends State<W>
    with Translator, ScreenSizer, PlatformManager, Themer {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initTranslator(context);
    initScreenSizer(context);
    initThemer(context);
  }

  @override
  Widget build(BuildContext context) {
    return baseBuild(context);
  }

  Widget baseBuild(BuildContext context);
}
