import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/core/resources/assets_manager.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/size_managers.dart';
import 'package:note_app/model/note_model/note_model.dart';
import 'package:note_app/view/home/widgets/custom_empty_body_home_screen.dart';

class CustomGridViewNotesBody extends StatelessWidget {
  const CustomGridViewNotesBody(
      {super.key,
      required this.outPutListNoteModel,
      required this.onTapAtNote});

  final Stream<List<NoteModel>> outPutListNoteModel;
  final void Function(NoteModel data) onTapAtNote;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NoteModel>>(
      stream: outPutListNoteModel,
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : snapshot.data == null
                  ? SizedBox()
                  : snapshot.data!.isEmpty
                      ? Center(
                          child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: CustomEmptyBodyHomeScreen()),
                        )
                      : GridView.builder(
                          padding: EdgeInsets.all(PaddingManager.p25),
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: HeightManager.h135,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 9,
                                  crossAxisSpacing: 11),
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              onTapAtNote(snapshot.data![index]);
                            },
                            child: CustomItemNote(
                              noteModel: snapshot.data![index],
                              color: index % 5 == 0
                                  ? ColorManager.listColorNotes[4]
                                  : index % 4 == 0
                                      ? ColorManager.listColorNotes[3]
                                      : index % 3 == 0
                                          ? ColorManager.listColorNotes[2]
                                          : index % 2 == 0
                                              ? ColorManager.listColorNotes[1]
                                              : ColorManager.listColorNotes[0],
                            ),
                          ),
                        ),
    );
  }
}

class CustomItemNote extends StatelessWidget {
  const CustomItemNote({
    super.key,
    required this.noteModel,
    required this.color,
  });

  final NoteModel noteModel;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius:
              BorderRadius.all(Radius.circular(BorderRadiusManager.br8))),
      padding: EdgeInsets.symmetric(
          horizontal: PaddingManager.p6, vertical: PaddingManager.p12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  SvgPicture.asset(AssetsManager.onBoardingBackgroundIdSvg),
                  Positioned(
                    right: 19,
                    top: 15,
                    bottom: 0,
                    child: Text(
                      noteModel.id.toString(),
                      style: TextStyle(
                        color: ColorManager.kWhiteColor,
                        fontSize: FontsManager.f12,
                        fontFamily: FontsManager.fontOtama,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButtonDoneStatus(status: noteModel.done),
                  Text(
                    noteModel.dateTime,
                    style: TextStyle(
                        fontSize: FontsManager.f8,
                        color: ColorManager.kWhiteColor),
                  ),
                ],
              )
            ],
          ),
          Text(
            noteModel.title,
            maxLines: 1,
            style: TextStyle(
              color: ColorManager.kWhiteColor,
              fontSize: FontsManager.f16,
              fontFamily: FontsManager.fontOtama,
            ),
          ),
          SizedBox(
            height: HeightManager.h4,
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            noteModel.desc,
            style: TextStyle(
              color: ColorManager.kGrey3Color,
              fontSize: FontsManager.f8,
              fontFamily: FontsManager.fontOtama,
            ),
          )
        ],
      ),
    );
  }
}

class ElevatedButtonDoneStatus extends StatelessWidget {
  const ElevatedButtonDoneStatus({
    super.key,
    required this.status,
  });

  final bool status;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          backgroundColor:
              status == true ? Color(0xff02463d) : Color(0xfff7dee3),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(BorderRadiusManager.br5)))),
      label: Text(
        status == true ? "Done" : "Not Done",
        style: TextStyle(
            fontSize: FontsManager.f12,
            fontFamily: FontsManager.fontOtama,
            color: status == true ? ColorManager.kWhiteColor : Colors.red),
      ),
      icon: Icon(
        status == true
            ? CupertinoIcons.checkmark_alt_circle_fill
            : CupertinoIcons.clear_circled_solid,
        color: status == true ? ColorManager.kLightGreen : Colors.red,
      ),
      onPressed: () {},
    );
  }
}
