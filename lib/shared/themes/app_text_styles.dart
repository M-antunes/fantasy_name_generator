import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';

import 'package:flutter/material.dart';

class AppTextStyle {
  static final generatedName = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: "David",
    fontSize: deviceWidth! < 350
        ? 24
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 26
            : 29,
    color: Colors.white,
  );
  static final chosenName = TextStyle(
    fontFamily: "David",
    color: Colors.white,
    fontSize: deviceWidth! < 350
        ? 24
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 26
            : 29,
  );
  static final levelDisplayStatsPageText = TextStyle(
    fontFamily: "David",
    color: Colors.white,
    fontSize: deviceWidth! < 350
        ? 29
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 31
            : 34,
  );
  static final levelDisplayEquipPageText = TextStyle(
    fontFamily: "David",
    color: AppColors.primaryText,
    fontSize: deviceWidth! < 350
        ? 21
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 24
            : 26,
  );
  static final epicLabel = TextStyle(
    color: AppColors.primaryGold,
    fontFamily: "Chomsky",
    fontSize: deviceWidth! < 350
        ? 17
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 19
            : 22,
  );
  static final legendaryLabel = TextStyle(
    color: AppColors.primaryOrange,
    fontFamily: "Grantmouth",
    fontSize: deviceWidth! < 350
        ? 19
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 21
            : 24,
  );
  static final warningButtonConfirm = TextStyle(
    color: AppColors.primaryGold,
    fontFamily: "Grantmouth",
    fontSize: deviceWidth! < 350
        ? 19
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 21
            : 24,
  );
  static final warningButtonDeny = TextStyle(
    color: AppColors.primaryOrange,
    fontFamily: "Grantmouth",
    fontSize: deviceWidth! < 350
        ? 19
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 21
            : 24,
  );
  static final nameExhibition = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: deviceWidth! < 350
        ? 19
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 21
            : 24,
  );
  static final nameExhibitionSheet = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: "Grantmouth",
    color: AppColors.primaryText,
    fontSize: deviceWidth! < 350
        ? 19
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 21
            : 24,
  );
  static final changeRace = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: deviceWidth! < 350
        ? 22
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 27
            : 30,
  );
  static final mainPageLabel = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "David",
    fontSize: deviceWidth! < 350
        ? 15
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 17
            : 20,
  );
  static final selectRace = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "Kallamar",
    fontSize: deviceWidth! < 350
        ? 17
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 20
            : 22,
  );
  static final selectAlignment = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "Kallamar",
    fontSize: deviceWidth! < 350
        ? 19
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 21
            : 24,
  );
  static final statsValue = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "David",
    fontSize: deviceWidth! < 350
        ? 14
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 16
            : 18,
  );
  static final statsLabel = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.grey,
    fontFamily: "David",
    fontSize: deviceWidth! < 350
        ? 13
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 15
            : 17,
  );
  static final skillClassLabel = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.grey,
    fontFamily: "David",
    fontSize: deviceWidth! < 350
        ? 11
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 13
            : 15,
  );

  static final statsLabelBrighter = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.grey[300],
    fontFamily: "David",
    fontSize: deviceWidth! < 350
        ? 13
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 15
            : 17,
  );

  static final modefier = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: "David",
    color: Colors.white,
    fontSize: deviceWidth! < 350
        ? 14
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 16
            : 18,
  );
  static final raceDescriptionLabel = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "David",
    fontSize: deviceWidth! < 350
        ? 16
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 18
            : 20,
  );
  static final alignmentLabel = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "David",
    fontSize: deviceWidth! < 350
        ? 14
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 16
            : 19,
  );
  static final penaltyStyle = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.errorColor,
    fontFamily: "David",
    fontSize: deviceWidth! < 350
        ? 19
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 20
            : 22,
  );
  static final penaltyStyleText = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.errorColor,
    fontFamily: "David",
    fontSize: deviceWidth! < 350
        ? 12
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 13
            : 14,
  );
  static final subTextGrey = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: "David",
    color: AppColors.primaryText0,
    fontSize: deviceWidth! < 350
        ? 15
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 17
            : 19,
  );
  static final subTextWhite = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "David",
    fontSize: deviceWidth! < 350
        ? 16
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 17
            : 19,
  );
  static final tabLabel = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.primaryOrange,
    fontFamily: "David",
    fontSize: deviceWidth! < 350
        ? 14
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 15
            : 17,
  );
  static final subTextRed = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    fontFamily: "David",
    fontSize: deviceWidth! < 350
        ? 16
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 17
            : 19,
  );
  static final subTextWhitePlusSize = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "David",
    fontSize: deviceWidth! < 350
        ? 19
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 20
            : 22,
  );
  static final subTextGreyPlusSize = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText,
    fontFamily: "David",
    fontSize: deviceWidth! < 350
        ? 17
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 19
            : 21,
  );
  static final weaponSelectedText = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText,
    fontFamily: "David",
    fontSize: deviceWidth! < 350
        ? 12
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 14
            : 16,
  );
  static final weaponCategoryText = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText2,
    fontFamily: "David",
    fontSize: deviceWidth! < 350
        ? 14
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 16
            : 19,
  );
  static final snackbarText = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: "David",
    color: Colors.white,
    fontSize: deviceWidth! < 350
        ? 14
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 16
            : 19,
  );
  static final atributeDivisionText = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: "David",
    color: AppColors.primaryText0,
    fontSize: deviceWidth! < 350
        ? 14
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 16
            : 19,
  );
  static final traitValue = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText2,
    fontFamily: "David",
    fontSize: deviceWidth! < 350
        ? 14
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 16
            : 19,
  );
  static final traitDescription = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: "David",
    color: Colors.grey,
    fontSize: deviceWidth! < 350
        ? 12
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 14
            : 17,
  );
  static final longDescription = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText0,
    fontSize: deviceWidth! < 350
        ? 12
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 13
            : 15,
  );
  static final weaponSelected = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
    fontSize: deviceWidth! < 350
        ? 12
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 13
            : 15,
  );
  static final weaponNotSelected = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText0,
    fontSize: deviceWidth! < 350
        ? 12
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 13
            : 15,
  );
  static final classSelected = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
    fontSize: deviceWidth! < 350
        ? 11
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 12
            : 13,
  );
  static final classNotSelected = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText0,
    fontSize: deviceWidth! < 350
        ? 11
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 12
            : 13,
  );
  static final equipTypeDisplayValue = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText2,
    fontSize: deviceWidth! < 350
        ? 10
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 11
            : 12,
  );
  static final equipTypeDisplay = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText0,
    fontSize: deviceWidth! < 350
        ? 10
        : deviceWidth! > 350 && deviceWidth! < 400
            ? 11
            : 12,
  );
}
