import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> callMessageSnackbar(
  BuildContext context,
  String text,
  color,
) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1800),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        backgroundColor: color,
        content: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(text, style: AppTextStyle.generatedName),
              ),
            ),
          ],
        ),
      ),
    );
