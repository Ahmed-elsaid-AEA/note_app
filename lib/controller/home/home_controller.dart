
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/core/database/hive/hive_helper.dart';
import 'package:note_app/core/resources/consts_values.dart';
import 'package:note_app/core/resources/routes_manager.dart';
import 'package:note_app/model/note_model/note_model.dart';

class HomeController{
  BuildContext context;
  HomeController(this.context);

  void goToAddNewNoteScreen() {
    Navigator.of(context).pushNamed(RoutesName.newNoteScreen);
  }
  Future<void > getAllNote()async{
    HiveHelper<NoteModel> hiveHelper=HiveHelper(ConstsValue.kNoteBox);
    print(await hiveHelper.getAllData());
  }
}