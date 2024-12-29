import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/consts_values.dart';
import 'package:note_app/core/resources/size_managers.dart';
import 'package:note_app/view/new_note_screen/widgets/custom_app_bar_new_note_screen.dart';

class NewNoteScreen extends StatelessWidget {
  const NewNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            right: PaddingManager.p25,
            left: PaddingManager.p25,
            top: PaddingManager.p14,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [CustomAppBarNewNoteScreen(onPressedBack: () {  }, onPressedAtMark: () {  },)],
            ),
          ),
        ),
      ),
    );
  }
}

