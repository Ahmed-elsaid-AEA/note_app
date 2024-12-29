import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note_app/core/resources/routes_manager.dart';

class OnBoardingController {
  void goToHomeScreen(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      RoutesName.homeScreen,
      (route) => false,
    );
  }
}
