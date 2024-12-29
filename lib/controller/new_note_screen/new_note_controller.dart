import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/consts_values.dart';
import 'package:note_app/core/resources/size_managers.dart';
import 'package:note_app/generated/assets.dart';

import '../../view/new_note_screen/widgets/bottom_sheet/custom_body_model_bttom_sheet_new_note.dart';

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
      builder: (context) => CustomBodyModelBottomSheetNewNote(
        onTapAtDeleteButton: onTapAtDeleteButton,
        onTapAtOkButton: onTapAtOkButton,
        onPressedClosed: onPressedClosed,
      ),
    );
  }

  void onTapAtDeleteButton() {
  }

  void onTapAtOkButton() {
  }

  void onPressedClosed() {
    Navigator.of(context).pop();
  }
}
