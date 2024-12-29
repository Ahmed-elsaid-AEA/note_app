import 'package:flutter/material.dart';
import 'package:note_app/core/resources/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesManager.onGenerateRoute,
      initialRoute: RoutesName.onBoardingScreen,
      // routes: RoutesManager.routes,
    );
  }
}
