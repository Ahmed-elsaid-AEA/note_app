import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/resources/assets_manager.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/consts_values.dart';
import 'package:note_app/core/resources/size_managers.dart';
import 'package:note_app/view/home/widgets/custom_empty_body_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(WeightManager.w70, HeightManager.h70),
              backgroundColor: ColorManager.kPrimaryColor,
              shape: CircleBorder()),
          onPressed: () {},
          child: Icon(
            CupertinoIcons.plus,
            color: ColorManager.kWhiteColor,
            size: FontsManager.f28,
          )),
      appBar: AppBar(
        title: Text(
          ConstsValue.kNote,
          style: TextStyle(
              fontFamily: FontsManager.fontOtama,
              color: ColorManager.kBlackColor,
              fontSize: FontsManager.f30),
        ),
        backgroundColor: ColorManager.kWhiteColor,
      ),
      body: CustomEmptyBodyHomeScreen(),
    );
  }
}
