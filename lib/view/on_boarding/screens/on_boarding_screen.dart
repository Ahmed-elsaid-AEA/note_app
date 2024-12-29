import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/controller/on_boarding/on_boarding_controller.dart';
import 'package:note_app/core/resources/assets_manager.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/consts_values.dart';
import 'package:note_app/core/resources/size_managers.dart';

import '../widgets/custom_bottom_nav_bar_on_boarding_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late OnBoardingController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=OnBoardingController();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kWhiteColor,
      bottomNavigationBar: CustomBottomNavBarOnBoardingScreen(
        onPressed: () {
          _controller.goToHomeScreen(context);
        },
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: PaddingManager.p30),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: HeightManager.h125,
            ),
            Image.asset(
              width: WeightManager.w282,
              AssetsManager.onBoardingPng,
            ),
            SizedBox(
              height: HeightManager.h55,
            ),
            Text(
              ConstsValue.onBoardingTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: FontsManager.fontOtama,
                  color: ColorManager.kBlackColor,
                  fontSize: FontsManager.f48),
            ),
            SizedBox(
              height: HeightManager.h20,
            ),
            Text(
              ConstsValue.onBoardingDesc,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ColorManager.kGreyColor,

                  fontFamily: FontsManager.fontOtama,
                  fontSize: FontsManager.f16),
            ),
          ],
        ),
      ),
    );
  }
}
