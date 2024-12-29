import 'package:flutter/material.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/consts_values.dart';
import 'package:note_app/core/resources/size_managers.dart';

class CustomTextFieldTitle extends StatelessWidget {
  const CustomTextFieldTitle({
    super.key,
    required this.titleController,
  });

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          fontSize: FontsManager.f48,
          fontFamily: FontsManager.fontOtama,
          color: ColorManager.kBlackColor),
      maxLines: 1,
      controller: titleController,
      decoration: InputDecoration(
          hintText: ConstsValue.kTitle,
          border: InputBorder.none,
          hintStyle: TextStyle(
              fontSize: FontsManager.f48,
              fontFamily: FontsManager.fontOtama,
              color: ColorManager.kGrey2Color)),
    );
  }
}
