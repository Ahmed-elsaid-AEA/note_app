import 'package:flutter/material.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/consts_values.dart';
import 'package:note_app/core/resources/size_managers.dart';

class CustomTextFiledDescNote extends StatelessWidget {
  const CustomTextFiledDescNote({
    super.key,
    required this.descController,
    this.active,
  });

  final TextEditingController descController;
  final bool? active;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: active,
      style: TextStyle(
          fontSize: FontsManager.f23,
          fontFamily: FontsManager.fontOtama,
          color: active == false
              ? ColorManager.kGrey3Color
              : ColorManager.kBlackColor),
      maxLines: null,
      controller: descController,
      decoration: InputDecoration(
          hintText: ConstsValue.kTypeSomeThing,
          border: InputBorder.none,
          hintStyle: TextStyle(
              fontSize: FontsManager.f23,
              fontFamily: FontsManager.fontOtama,
              color: ColorManager.kGrey2Color)),
    );
  }
}
