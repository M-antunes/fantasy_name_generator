import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> callMessageSnackbar(
  BuildContext context,
  String text,
  color,
) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        // margin: EdgeInsets.symmetric(horizontal: 12),
        duration: const Duration(milliseconds: 1800),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        backgroundColor: color,
        content: Text(
          text,
          style: AppTextStyle.flipCardMale,
          textAlign: TextAlign.center,
        ),
      ),
    );
