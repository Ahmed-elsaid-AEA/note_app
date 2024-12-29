import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/core/resources/assets_manager.dart';
import 'package:note_app/core/resources/colors_manager.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 50),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(75, 75),
                backgroundColor: ColorManager.kPrimaryColor,
                shape: CircleBorder()),
            onPressed: () {},
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: ColorManager.kWhiteColor,
              size: 15,
            )),
      ),
      body: Container(

        width: double.infinity,
         child: Column(
          children: [
            SizedBox(height:125 ,),
            Image.asset(
              width: 282,
              AssetsManager.onBoardingPng,
            ),
            Text("data")
          ],
        ),
      ),
    );
  }
}
