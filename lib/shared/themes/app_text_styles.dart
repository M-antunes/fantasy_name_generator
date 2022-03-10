import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';

import 'package:flutter/material.dart';

class AppTextStyle {
  static final generatedName = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: "David",
    fontSize: deviceWidth! < 400 ? 24 : 29,
    color: Colors.white,
  );
  static final chosenName = TextStyle(
    fontFamily: "David",
    color: Colors.white,
    fontSize: deviceWidth! < 400 ? 23 : 29,
  );
  static final levelDisplayStatsPageText = TextStyle(
    fontFamily: "David",
    color: Colors.white,
    fontSize: deviceWidth! < 400 ? 29 : 34,
  );
  static final levelDisplayEquipPageText = TextStyle(
    fontFamily: "David",
    color: AppColors.primaryText,
    fontSize: deviceWidth! < 400 ? 21 : 26,
  );
  static final epicLabel = TextStyle(
    color: AppColors.primaryGold,
    fontFamily: "Chomsky",
    fontSize: deviceWidth! < 400 ? 17 : 22,
  );
  static final legendaryLabel = TextStyle(
    color: AppColors.primaryOrange,
    fontFamily: "Grantmouth",
    fontSize: deviceWidth! < 400 ? 19 : 24,
  );
  static final nameExhibition = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: deviceWidth! < 400 ? 19 : 24,
  );
  static final changeRace = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: deviceWidth! < 400 ? 17 : 22,
  );
  static final mainPageLabel = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "David",
    fontSize: deviceWidth! < 400 ? 15 : 20,
  );
  static final selectRace = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "Kallamar",
    fontSize: deviceWidth! < 400 ? 17 : 22,
  );
  static final selectAlignment = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "Kallamar",
    fontSize: deviceWidth! < 400 ? 19 : 24,
  );
  static final statsValue = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "David",
    fontSize: deviceWidth! < 400 ? 14 : 19,
  );
  static final statsLabel = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.grey,
    fontFamily: "David",
    fontSize: deviceWidth! < 400 ? 13 : 18,
  );
  static final modefier = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: "David",
    color: Colors.white,
    fontSize: deviceWidth! < 400 ? 14 : 19,
  );
  static final raceDescriptionLabel = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "David",
    fontSize: deviceWidth! < 400 ? 18 : 23,
  );
  static final alignmentLabel = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "David",
    fontSize: deviceWidth! < 400 ? 14 : 19,
  );
  static final subTextGrey = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: "David",
    color: AppColors.primaryText0,
    fontSize: deviceWidth! < 400 ? 15 : 19,
  );
  static final subTextWhite = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "David",
    fontSize: deviceWidth! < 400 ? 16 : 19,
  );
  static final subTextWhitePlusSize = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "David",
    fontSize: deviceWidth! < 400 ? 19 : 22,
  );
  static final subTextGreyPlusSize = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText,
    fontFamily: "David",
    fontSize: deviceWidth! < 400 ? 17 : 21,
  );
  static final weaponSelectedText = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText,
    fontFamily: "David",
    fontSize: deviceWidth! < 400 ? 14 : 19,
  );
  static final weaponCategoryText = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText2,
    fontFamily: "David",
    fontSize: deviceWidth! < 400 ? 14 : 19,
  );
  static final snackbarText = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: "David",
    color: Colors.white,
    fontSize: deviceWidth! < 400 ? 14 : 19,
  );
  static final atributeDivisionText = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: "David",
    color: Colors.white,
    fontSize: deviceWidth! < 400 ? 14 : 19,
  );
  static final traitValue = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText2,
    fontFamily: "David",
    fontSize: deviceWidth! < 400 ? 14 : 19,
  );
  static final traitDescription = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: "David",
    color: Colors.grey,
    fontSize: deviceWidth! < 400 ? 12 : 17,
  );
  static final longDescription = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText0,
    fontSize: deviceWidth! < 400 ? 12 : 15,
  );
  static final weaponSelected = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
    fontSize: deviceWidth! < 400 ? 12 : 15,
  );
  static final weaponNotSelected = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText0,
    fontSize: deviceWidth! < 400 ? 12 : 15,
  );
}
