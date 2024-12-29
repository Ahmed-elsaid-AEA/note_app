import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/size_managers.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key, required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(WeightManager.w70, HeightManager.h70),
            backgroundColor: ColorManager.kPrimaryColor,
            shape: CircleBorder()),
        onPressed: onPressed,
        child: Icon(
          CupertinoIcons.plus,
          color: ColorManager.kWhiteColor,
          size: FontsManager.f28,
        ));
  }
}
