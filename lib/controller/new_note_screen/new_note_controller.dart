import 'package:flutter/cupertino.dart';

class NewNoteController {
  BuildContext context;
  NewNoteController(this.context);
  void goBack(){
    Navigator.of(context).pop();
  }
}
