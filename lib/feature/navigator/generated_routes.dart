import 'package:flutter/material.dart';
import 'package:split/res/routes.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const Navigator());
      case Routes.navigator:
        return MaterialPageRoute(builder: (_) => const Navigator());

      default:
        return undefinedRoute;
    }
  }

  static Route<dynamic> undefinedRoute = MaterialPageRoute(
    builder: (context) => const Scaffold(
      body: Center(child: Text('')),
    ),
  );
}
