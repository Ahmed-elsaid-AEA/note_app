import 'package:flutter/material.dart';
import 'package:note_app/view/not_found_route/screens/no_found_route_screen.dart';
import 'package:note_app/view/on_boarding/screens/on_boarding_screen.dart';

class RoutesName {
  RoutesName._();

  static const String onBoardingScreen = '/';
}

class RoutesManager {
  RoutesManager._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Widget body;
    switch (settings.name) {
      case RoutesName.onBoardingScreen:
        body = OnBoardingScreen();
      default:
        body = NoFoundRouteScreen();
        break;
    }
    return MaterialPageRoute(
      builder: (context) => body,
    );
  }

// static Map<String, WidgetBuilder> routes = {
//   RoutesName.onBoardingScreen: (context) => OnBoardingScreen(),
// };
}