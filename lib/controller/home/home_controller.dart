import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/core/database/hive/hive_helper.dart';
import 'package:note_app/core/resources/consts_values.dart';
import 'package:note_app/core/resources/routes_manager.dart';
import 'package:note_app/model/note_model/note_model.dart';

class HomeController {
  BuildContext context;

  HomeController(this.context) {
    start();
  }

  Future<void> start() async {
    await initController();
    await getAllNote();
  }

  late StreamController<List<NoteModel>> _controllerNotes;
  late Sink<List<NoteModel>> _inputNotes;
  late Stream<List<NoteModel>> outPutNotes;

  Future<void> initController() async {
    _controllerNotes = StreamController();
    _inputNotes = _controllerNotes.sink;
    outPutNotes = _controllerNotes.stream;
  }

  Future<void> disposeController() async {
    _controllerNotes.close();
    _inputNotes.close();
  }

  void goToAddNewNoteScreen() {
    Navigator.of(context).pushNamed(RoutesName.newNoteScreen).then(
      (value) {
        getAllNote();
      },
    );
  }

  Future<void> getAllNote() async {
    _inputNotes.add([]);
    HiveHelper<NoteModel> hiveHelper = HiveHelper(ConstsValue.kNoteBox);
    Map<dynamic, NoteModel> data = await hiveHelper.getAllData();
     _inputNotes.add(data.values.toList());
  }

  void onTapAtItemNote(NoteModel data) {
    Navigator.of(context).pushNamed(RoutesName.newNoteScreen, arguments: data);
  }
}
