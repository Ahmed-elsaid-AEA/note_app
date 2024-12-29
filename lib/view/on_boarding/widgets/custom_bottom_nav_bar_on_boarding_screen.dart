import 'package:flutter/material.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/size_managers.dart';

class CustomBottomNavBarOnBoardingScreen extends StatelessWidget {
  const CustomBottomNavBarOnBoardingScreen({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: PaddingManager.p50),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(WeightManager.w75, HeightManager.h75),
              backgroundColor: ColorManager.kPrimaryColor,
              shape: CircleBorder()),
          onPressed: onPressed,
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            color: ColorManager.kWhiteColor,
            size: FontsManager.f15,
          )),
    );
  }
}
