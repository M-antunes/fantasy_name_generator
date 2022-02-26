import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const generatedName = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );
  static const chosenRace = TextStyle(
    fontFamily: "Grantmouth",
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
    fontSize: 30,
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
  static const changeRace = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: 22,
  );
  static const selectRace = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: 17,
  );
  static const selectButtonNotReady = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: 15,
  );
  static const selectButtonReady = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontSize: 21,
  );
}
