import 'package:flutter/material.dart';
import 'package:split/res/app_asset_paths.dart';

class AuthBase extends StatelessWidget {
  const AuthBase({super.key, required this.body});
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              AppAssetPaths.splashScreenBackground,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              body,
            ],
          ),
        ],
      ),
    );
  }
}
