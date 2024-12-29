import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/core/resources/assets_manager.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/size_managers.dart';
import 'package:note_app/model/note_model/note_model.dart';

class CustomGridViewNotesBody extends StatelessWidget {
  const CustomGridViewNotesBody({super.key, required this.outPutListNoteModel});

  final Stream<List<NoteModel>> outPutListNoteModel;

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
                  : GridView.builder(
                      padding: EdgeInsets.all(PaddingManager.p25),
                      itemCount: snapshot.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: HeightManager.h135,
                          crossAxisCount: 2,
                          mainAxisSpacing: 9,
                          crossAxisSpacing: 11),
                      itemBuilder: (context, index) => CustomItemNote(
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
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff02463d),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(BorderRadiusManager.br5)))),
                    label: Text(
                      "Done",
                      style: TextStyle(
                          fontSize: FontsManager.f12,
                          fontFamily: FontsManager.fontOtama,
                          color: ColorManager.kWhiteColor),
                    ),
                    icon: Icon(
                      CupertinoIcons.checkmark_alt_circle_fill,
                      color: ColorManager.kLightGreen,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    "Mon, April, 2002",
                    style: TextStyle(
                        fontSize: FontsManager.f8,
                        color: ColorManager.kWhiteColor),
                  ),
                ],
              )
            ],
          ),
          Text(
            "Title 1",
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
            "Title   sd  ds sd ds ds ds  sd ds ds sd sd sd dsd sds d ds ds ds sd ds sd sd ds ds ds  ds ds ds ds ds ds ",
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
