import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const generatedName = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );
  static const chosenName = TextStyle(
    fontFamily: "Grantmouth",
    color: Colors.white,
    fontSize: 29,
  );
  static const epicLabel = TextStyle(
    color: AppColors.primaryGold,
    fontSize: 25,
  );
  static const flipCardMale = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 15,
  );
  static const flipCardFemale = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 15,
  );
  static const nameExhibition = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: 24,
  );
  static const changeRace = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: 22,
  );
  static const mainPageLabel = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: 18,
  );
  static const selectRace = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: 17,
  );
  static const statsValue = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: 15,
  );
  static final modefier = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.grey[200]!,
    fontSize: 15,
  );
  static const statsLabel = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.grey,
    fontSize: 13,
  );
  static const selectButtonNotReady = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.grey,
    fontSize: 15,
  );
  static const selectButtonReady = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: 19,
  );
}
