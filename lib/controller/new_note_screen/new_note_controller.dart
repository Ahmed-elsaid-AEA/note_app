import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/core/database/hive/hive_helper.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/consts_values.dart';
import 'package:note_app/core/resources/size_managers.dart';
import 'package:note_app/generated/assets.dart';
import 'package:note_app/model/note_model/note_model.dart';

import '../../view/new_note_screen/widgets/bottom_sheet/custom_body_model_bttom_sheet_new_note.dart';

class NewNoteController {
  BuildContext context;
  NoteModel? noteModel;

  NewNoteController(this.context) {
    start();
  }

  late TextEditingController titleController;
  late TextEditingController descController;

  Future<void> start() async {
    await initController();
    if (noteModel != null) {
      //? fill data
      fillDataNote();
    }
  }

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
      addNewNoteToHive();
      //?add data to hive
      //?close
    }
    //?=============
  }

  Future<void> addNewNoteToHive() async {
    int id = await getIdDefaultToNote();
    id++;
    NoteModel noteModel = NoteModel(
        id: id,
        title: titleController.text.trim(),
        desc: descController.text.trim(),
        dateTime: DateTime.now().toString(),
        done: false);

    HiveHelper<NoteModel> hiveHelper = HiveHelper(ConstsValue.kNoteBox);
    await hiveHelper.addValue(key: id.toString(), value: noteModel);
    //? now change value of default id
    await addIDDefaultToNote(id);
    //?return to main screen
    Navigator.of(context).pop();
  }

  Future<int> getIdDefaultToNote() async {
    HiveHelper<int> helper = HiveHelper(ConstsValue.kIDNoteBox);
    int? id = await helper.getValue(key: ConstsValue.kID);
    return id ?? 0;
  }

  Future<void> addIDDefaultToNote(int id) async {
    HiveHelper<int> helper = HiveHelper(ConstsValue.kIDNoteBox);
    await helper.addValue(key: ConstsValue.kID, value: id);
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
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  void onTapAtOkButton() {
    Navigator.of(context).pop();
  }

  void onPressedClosed() {
    Navigator.of(context).pop();
  }

  void getArguments() {
    var arg = ModalRoute.of(context)!.settings.arguments;
    print(arg is NoteModel);
    if (arg != null) {
      //?now in edit
      noteModel = arg as NoteModel;
    }
  }

  void fillDataNote() {
    //? desc
    descController.text=noteModel!.desc;

    //? title
    titleController.text=noteModel!.title;
  }
}
