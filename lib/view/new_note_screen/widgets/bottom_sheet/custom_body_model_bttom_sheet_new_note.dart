import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/resources/colors_manager.dart';
import 'package:note_app/core/resources/consts_values.dart';
import 'package:note_app/core/resources/size_managers.dart';
import 'package:note_app/generated/assets.dart';

class CustomBodyModelBottomSheetNewNote extends StatelessWidget {
  const CustomBodyModelBottomSheetNewNote({
    super.key,
    required this.onTapAtDeleteButton,
    required this.onTapAtOkButton,
    required   this.onPressedClosed,
  });

  final GestureTapCallback onTapAtDeleteButton;
  final GestureTapCallback onTapAtOkButton;
  final VoidCallback onPressedClosed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: PaddingManager.p15),
      margin: EdgeInsets.symmetric(horizontal: PaddingManager.p8),
      decoration: BoxDecoration(
          color: ColorManager.kWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(BorderRadiusManager.br15),
            topRight: Radius.circular(BorderRadiusManager.br15),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    ConstsValue.kShouldAddTitleAndDesc,
                    style: TextStyle(
                      color: ColorManager.kBlackColor,
                      fontSize: FontsManager.f16,
                      fontFamily: FontsManager.fontOtama,
                    ),
                  ),
                  Text(
                    ConstsValue.kToSave,
                    style: TextStyle(
                      color: ColorManager.kGrey2Color,
                      fontSize: FontsManager.f10,
                      fontFamily: FontsManager.fontOtama,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: WeightManager.w41,
              ),
              SizedBox(
                width: WeightManager.w16,
                height: HeightManager.h16,
                child: IconButton.filled(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(WeightManager.w16, HeightManager.h16),
                      backgroundColor: ColorManager.kGrey3Color),
                  onPressed: onPressedClosed,
                  icon: Icon(
                    Icons.close,
                    size: FontsManager.f8,
                    color: ColorManager.kWhiteColor,
                  ),
                  color: ColorManager.kWhiteColor,
                ),
              ),
              SizedBox(
                width: WeightManager.w16,
              ),
            ],
          ),
          SizedBox(
            height: HeightManager.h16,
          ),
          Divider(
            height: 0,
          ),
          SizedBox(
            height: HeightManager.h16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomOkButton(
                onTapAtOkButton: onTapAtOkButton,
              ),
              SizedBox(
                width: WeightManager.w33,
              ),
              CustomDeleteButton(
                onTapAtDeleteButton: onTapAtDeleteButton,
              )
            ],
          ),
          SizedBox(
            height: HeightManager.h16,
          ),
        ],
      ),
    );
  }
}

class CustomDeleteButton extends StatelessWidget {
  const CustomDeleteButton({
    super.key,
    required this.onTapAtDeleteButton,
  });

  final GestureTapCallback onTapAtDeleteButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapAtDeleteButton,
      child: Column(
        children: [
          Icon(
            CupertinoIcons.delete,
            color: Colors.red,
          ),
          Text(
            ConstsValue.kDelete,
            style: TextStyle(
                fontSize: FontsManager.f10,
                fontFamily: Assets.fontsOtamaEp,
                color: ColorManager.kGrey2Color),
          )
        ],
      ),
    );
  }
}

class CustomOkButton extends StatelessWidget {
  const CustomOkButton({
    super.key,
    required this.onTapAtOkButton,
  });

  final GestureTapCallback onTapAtOkButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapAtOkButton,
      child: Column(
        children: [
          Icon(
            CupertinoIcons.check_mark_circled,
            color: ColorManager.kPrimaryColor,
          ),
          Text(
            ConstsValue.kOk,
            style: TextStyle(
                fontSize: FontsManager.f10,
                fontFamily: Assets.fontsOtamaEp,
                color: ColorManager.kGrey2Color),
          )
        ],
      ),
    );
  }
}
