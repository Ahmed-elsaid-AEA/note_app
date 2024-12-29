import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/controller/home/home_controller.dart';
import 'package:note_app/core/resources/assets_manager.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/consts_values.dart';
import 'package:note_app/core/resources/size_managers.dart';
import 'package:note_app/view/home/widgets/custom_empty_body_home_screen.dart';
import 'package:note_app/view/new_note_screen/widgets/custom_grid_view_notes_body.dart';

import '../widgets/custom_floating_action_button_home_scren.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = HomeController(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          _controller.goToAddNewNoteScreen();
        },
      ),
      appBar: AppBar(
        title: Text(
          ConstsValue.kNote,
          style: TextStyle(
              fontFamily: FontsManager.fontOtama,
              color: ColorManager.kBlackColor,
              fontSize: FontsManager.f30),
        ),
        backgroundColor: ColorManager.kWhiteColor,
      ),
      body: RefreshIndicator(
          onRefresh: () async {
            _controller.getAllNote();
          },
          child: true
              ? CustomGridViewNotesBody(
                  outPutListNoteModel: _controller.outPutNotes,
                )
              : SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: CustomEmptyBodyHomeScreen())),
    );
  }
}
