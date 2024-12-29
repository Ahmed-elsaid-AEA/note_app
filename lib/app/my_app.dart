import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/consts_values.dart';
import 'package:note_app/core/resources/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
          ConstsValue.figmaWidthDesign, ConstsValue.figmaHeightDesign),
      minTextAdapt: true,
      child: MaterialApp(
        theme: ThemeData.light()
            .copyWith(scaffoldBackgroundColor: ColorManager.kWhiteColor),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.onGenerateRoute,
        initialRoute: RoutesName.onBoardingScreen,
        // routes: RoutesManager.routes,
      ),
    );
  }
}
