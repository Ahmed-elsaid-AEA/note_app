import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/core/resources/assets_manager.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/size_managers.dart';

class CustomGridViewNotesBody extends StatelessWidget {
  const CustomGridViewNotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(PaddingManager.p25),
      itemCount: 5,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent:HeightManager.h135,
          crossAxisCount: 2,
          mainAxisSpacing: 9,
          crossAxisSpacing: 11),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
            color: Color(0xff021815),
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
                    Positioned(
                      // right: 0,
                      // left: 0,
                      // top: 0,
                      // bottom: 0,
                      child: Text(
                        "1",
                        style: TextStyle(
                          color: ColorManager.kWhiteColor,
                          fontSize: FontsManager.f12,
                          fontFamily: FontsManager.fontOtama,
                        ),
                      ),
                    ),
                    SvgPicture.asset(AssetsManager.onBoardingBackgroundIdSvg),
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
      ),
    );
  }
}
