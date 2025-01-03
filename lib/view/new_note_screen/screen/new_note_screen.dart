import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/new_note_screen/new_note_controller.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/consts_values.dart';
import 'package:note_app/core/resources/size_managers.dart';
import 'package:note_app/view/new_note_screen/widgets/custom_app_bar_new_note_screen.dart';
import 'package:note_app/view/new_note_screen/widgets/custom_test_field_desc_note.dart';
import 'package:note_app/view/new_note_screen/widgets/custom_text_field_title.dart';

class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen({super.key});

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  late NewNoteController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = NewNoteController(context);
  }

  @override
  void dispose() {
    _controller.disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.getArguments();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            right: PaddingManager.p25,
            left: PaddingManager.p25,
            top: PaddingManager.p14,
          ),
          child: StreamBuilder<bool?>(
              stream: _controller.outputEditStatus,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    CustomAppBarNewNoteScreen(
                      onPressedBack: () {
                        _controller.goBack();
                      },
                      onPressedAtMark: () {
                        _controller.onTapAtMarkIcon();
                      },
                      editNow: snapshot.data,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          CustomTextFieldTitle(
                            active: snapshot.data,
                            titleController: _controller.titleController,
                          ),
                          Expanded(
                            child: CustomTextFiledDescNote(
                              active: snapshot.data,
                              descController: _controller.descController,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
