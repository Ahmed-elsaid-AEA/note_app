import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/new_note_screen/new_note_controller.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/consts_values.dart';
import 'package:note_app/core/resources/size_managers.dart';
import 'package:note_app/view/new_note_screen/widgets/custom_app_bar_new_note_screen.dart';

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
    _controller=NewNoteController(context);
  }
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
          child: Column(
            children: [
              CustomAppBarNewNoteScreen(
                onPressedBack: () {
                  _controller.goBack();
                },
                onPressedAtMark: () {},
              ),
              Form(
                  child: Expanded(
                    child: Column(
                                    children: [
                    TextFormField(
                      style: TextStyle(
                          fontSize: FontsManager.f48,
                          fontFamily: FontsManager.fontOtama,
                          color: ColorManager.kBlackColor),
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: ConstsValue.kTitle,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: FontsManager.f48,
                              fontFamily: FontsManager.fontOtama,
                              color: ColorManager.kGrey2Color)),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: FontsManager.f23,
                            fontFamily: FontsManager.fontOtama,
                            color: ColorManager.kBlackColor),
                        maxLines: null,
                        decoration: InputDecoration(
                            hintText: ConstsValue.kTypeSomeThing,

                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                fontSize: FontsManager.f23,
                                fontFamily: FontsManager.fontOtama,
                                color: ColorManager.kGrey2Color)),
                      ),
                    )
                                    ],
                                  ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
