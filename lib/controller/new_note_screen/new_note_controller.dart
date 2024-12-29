import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/consts_values.dart';
import 'package:note_app/core/resources/size_managers.dart';
import 'package:note_app/generated/assets.dart';

class NewNoteController {
  BuildContext context;

  NewNoteController(this.context) {
    initController();
  }

  late TextEditingController titleController;
  late TextEditingController descController;

  Future<void> initController() async {
    titleController = TextEditingController();
    descController = TextEditingController();
  }

  Future<void> disposeController() async {
    titleController.dispose();
    descController.dispose();
  }

  void goBack() {
    Navigator.of(context).pop();
  }

  void onTapAtMarkIcon() {
    addNewNote();
  }

  void addNewNote() {
    //?add status========
    if (titleController.text.trim().isEmpty || descController.text.isEmpty) {
      //?now will show alert bottom sheet
      showAlertBottomSheet();
    } else {
      log("object");
      //?add data to hive
      //?close
    }
    //?=============
  }

  void showAlertBottomSheet() {
    FocusScope.of(context).unfocus();
    showModalBottomSheet(
      // isDismissible: false,
      backgroundColor: Colors.transparent,

      context: context,
      builder: (context) => Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: PaddingManager.p15),
        margin: EdgeInsets.symmetric(horizontal: PaddingManager.p8),
        decoration: BoxDecoration(
            color: ColorManager.kWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(BorderRadiusManager.br15),
              topRight: Radius.circular(BorderRadiusManager.br15),
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      ConstsValue.kShouldAddTitleAndDesc,
                      style: TextStyle(
                        color: ColorManager.kBlackColor,
                        fontSize: FontsManager.f16,
                        fontFamily: FontsManager.fontOtama,
                      ),
                    ),
                    Text(
                      ConstsValue.kToSave,
                      style: TextStyle(
                        color: ColorManager.kGrey2Color,
                        fontSize: FontsManager.f10,
                        fontFamily: FontsManager.fontOtama,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: WeightManager.w41,
                ),
                IconButton.filled(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.kGrey2Color),
                  onPressed: () {},
                  icon: Icon(Icons.close),
                  color: ColorManager.kWhiteColor,
                ),
                SizedBox(
                  width: WeightManager.w16,
                ),
              ],
            ),
            SizedBox(
              height: HeightManager.h16,
            ),
            Divider(
              height: 0,
            ),
            SizedBox(
              height: HeightManager.h16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Column(
                    children: [
                      Icon(CupertinoIcons.check_mark_circled,color: ColorManager.kPrimaryColor,),
                      Text(
                        ConstsValue.kOk,
                        style: TextStyle(
                            fontSize: FontsManager.f10,
                            fontFamily: Assets.fontsOtamaEp,
                            color: ColorManager.kGrey2Color),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: WeightManager.w33,
                ),
                InkWell(
                  child: Column(
                    children: [
                      Icon(
                        CupertinoIcons.delete,
                        color: Colors.red,
                      ),
                      Text(
                        ConstsValue.kDelete,
                        style: TextStyle(
                            fontSize: FontsManager.f10,
                            fontFamily: Assets.fontsOtamaEp,
                            color: ColorManager.kGrey2Color),
                      )
                    ],
                  ),
                )
              ],
            ), SizedBox(
              height: HeightManager.h16,
            ),
          ],
        ),
      ),
    );
  }
}
