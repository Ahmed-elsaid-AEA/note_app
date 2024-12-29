
import 'package:flutter/material.dart';
import 'package:note_app/core/resources/routes_manager.dart';

class HomeController{
  BuildContext context;
  HomeController(this.context);

  void goToAddNewNoteScreen() {
    Navigator.of(context).pushNamed(RoutesName.newNoteScreen);
  }
}