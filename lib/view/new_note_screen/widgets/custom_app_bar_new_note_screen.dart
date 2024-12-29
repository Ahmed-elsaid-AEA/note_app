import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/consts_values.dart';
import 'package:note_app/core/resources/size_managers.dart';

class CustomAppBarNewNoteScreen extends StatelessWidget {
  const CustomAppBarNewNoteScreen({
    super.key,
    required this.onPressedBack,
    required this.onPressedAtMark,
    required this.editNow,
  });

  final VoidCallback onPressedBack;
  final VoidCallback onPressedAtMark;
  final bool? editNow;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                elevation: 0),
            label: Text(
              ConstsValue.kBack,
              style: TextStyle(
                  fontFamily: FontsManager.fontOtama,
                  fontSize: FontsManager.f20,
                  color: ColorManager.kPrimaryColor),
            ),
            onPressed: onPressedBack,
            icon: Icon(
              CupertinoIcons.back,
              size: FontsManager.f30,
              color: ColorManager.kPrimaryColor,
            )),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  horizontal: PaddingManager.p7, vertical: PaddingManager.p6),
              minimumSize: Size(WeightManager.w33, HeightManager.h33),
              backgroundColor: ColorManager.kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(BorderRadiusManager.br10))),
            ),
            onPressed: onPressedAtMark,
            child: Icon(
              editNow == null
                  ? CupertinoIcons.check_mark_circled
                  : editNow == false
                      ? Icons.edit
                      : CupertinoIcons.check_mark_circled,
              color: ColorManager.kWhiteColor,
              size: FontsManager.f20,
            )),
      ],
    );
  }
}
