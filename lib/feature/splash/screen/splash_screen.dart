import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:split/core/widgets/base_stateful_widget.dart';
import 'package:split/preferences/preferences_manager.dart';
import 'package:split/res/app_asset_paths.dart';

class SplashScreen extends BaseStatefulWidget {
  static const String routeName = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  var preferencesManager = GetIt.I<PreferencesManager>();
  late Timer time;
  @override
  void initState() {
    super.initState();

    /// to start time to switch to another screen
    _startTime();
  }

  @override
  void dispose() {
    time.cancel();
    super.dispose();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[_backgroundImage(), _logoWidget()],
      ),
    );
  }

  ///////////////////////////////////////////////////////////
  //////////////////// Widget methods ///////////////////////
  ///////////////////////////////////////////////////////////

  Widget _logoWidget() {
    return const Center(child: FlutterLogo());
  }

  Widget _backgroundImage() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        AppAssetPaths.splashScreenBackground,
        fit: BoxFit.cover,
      ),
    );
  }

  ///////////////////////////////////////////////////////////
  /////////////////// Helper methods ////////////////////////
  ///////////////////////////////////////////////////////////

  /// time to switch with dummy screen
  Future<Timer> _startTime() async {
    var duration = const Duration(milliseconds: 1000);
    return Timer(duration, _navigationPage);
  }

  /// navigate to next screen
  Future<void> _navigationPage() async {
    try {
      bool isLogged = await preferencesManager.isLoggedIn();
      if (isLogged) {
        _openHomeScreen();
      } else {
        _openLoginScreen();
      }
    } catch (error) {
      _openLoginScreen();
    }
  }

  void _openLoginScreen() async {
    // await Navigator.of(context)
    //     .pushNamedAndRemoveUntil(LoginScreen.routeName, (_) => false);
  }

  void _openHomeScreen() async {
    // await Navigator.of(context)
    //     .pushNamedAndRemoveUntil(HomeScreen.routeName, (_) => false);
  }
}
