import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/resources/assets_manager.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/consts_values.dart';
import 'package:note_app/core/resources/size_managers.dart';

class CustomEmptyBodyHomeScreen extends StatelessWidget {
  const CustomEmptyBodyHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            width: WeightManager.w286,
            AssetsManager.onBoardingPng,
          ),
          SizedBox(
            height: HeightManager.h6,
          ),
          Text(
            ConstsValue.kCreateYourFirstNote,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: FontsManager.fontOtama,
                color: ColorManager.kBlackColor,
                fontSize: FontsManager.f20),
          ),
          SizedBox(height: HeightManager.h55,)
        ],
      ),
    );
  }
}
