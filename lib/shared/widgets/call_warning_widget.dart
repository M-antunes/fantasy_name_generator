import 'package:flutter/material.dart';

import '../themes/app_text_styles.dart';

Future<dynamic> callWarningWidget(
  BuildContext context,
  String text,
) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Warning",
            style: AppTextStyle.changeRace,
          ),
          content: Text(
            text,
            style: AppTextStyle.subTextGreyPlusSize,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  "Ok",
                  style: AppTextStyle.epicLabel,
                ))
          ],
        );
      });
}
