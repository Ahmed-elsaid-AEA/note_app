import 'package:flutter/material.dart';
import 'package:note_app/view/on_boarding/screens/on_boarding_screen.dart';

class RoutesName {
  RoutesName._();

  static const String onBoardingScreen = '/onBoardingScreen';
}

class RoutesManager {
  RoutesManager._();
  static Map<String, WidgetBuilder> routes = {
    RoutesName.onBoardingScreen: (context) => OnBoardingScreen(),
  };
}
