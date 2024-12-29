import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note_app/core/database/hive/hive_helper.dart';
import 'package:note_app/core/resources/consts_values.dart';
import 'package:note_app/model/note_model/note_model.dart';
import 'package:note_app/view/new_note_screen/widgets/bottom_sheet/custom_alert_edit_or_delete_note.dart';

import '../../view/new_note_screen/widgets/bottom_sheet/custom_body_model_bttom_sheet_new_note.dart';

class NewNoteController {
  BuildContext context;
  NoteModel? noteModel;
  bool? editStatus;

  //?edit : null > add new note
  //?edit : true > now you can edit
  //?edit : false > you should change value to true to can edit

  NewNoteController(this.context) {
    start();
  }

  late TextEditingController titleController;
  late TextEditingController descController;
  late StreamController<bool?> _controllerEditStatus;
  late Sink<bool?> _inputEditStatus;
  late Stream<bool?> outputEditStatus;

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
    _controllerEditStatus = StreamController();
    _inputEditStatus = _controllerEditStatus.sink;
    outputEditStatus = _controllerEditStatus.stream;
  }

  Future<void> disposeController() async {
    titleController.dispose();
    descController.dispose();
  }

  void goBack() {
    Navigator.of(context).pop();
  }

  void onTapAtMarkIcon() {
    if (noteModel == null) {
      //?add status
      addNewNote();
    } else {
      //?edit
      //?now show bottom sheet alert to choose edit or delete
      showAlertEditORDeleteNoteBottomSheet();
    }
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

  void showAlertEditORDeleteNoteBottomSheet() {
    FocusScope.of(context).unfocus();
    showModalBottomSheet(
      // isDismissible: false,
      backgroundColor: Colors.transparent,

      context: context,
      builder: (context) => CustomAlertEditOrDeleteNote(
        onTapAtDeleteButton: onTapAtINEditStatusDeleteButton,
        onTapAtEditButton: onTapAtINEditStatusEditButton,
        onPressedClosed: onPressedClosed,
      ),
    );
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

  Future<void> onTapAtINEditStatusDeleteButton() async{
    HiveHelper<NoteModel> hiveHelper = HiveHelper(ConstsValue.kNoteBox);
    await hiveHelper.deleteValue(key: noteModel!.id.toString());
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  void onTapAtINEditStatusEditButton() {
    Navigator.of(context).pop();
    editStatus = true;
    _inputEditStatus.add(editStatus);
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
    descController.text = noteModel!.desc;

    //? title
    titleController.text = noteModel!.title;

    //?change  edit status
    editStatus = false;
    _inputEditStatus.add(editStatus);
  }
}
