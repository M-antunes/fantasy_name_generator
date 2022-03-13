import 'package:flutter/material.dart';

import '../../../shared/themes/app_text_styles.dart';

Future<dynamic> callDualWeildCheck(
  BuildContext context,
  String text,
  VoidCallback onPressed,
) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 6,
          content: Text(
            text,
            style: AppTextStyle.subTextGreyPlusSize,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: Text(
                "Yes",
                style: AppTextStyle.warningButtonConfirm,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "No",
                style: AppTextStyle.warningButtonDeny,
              ),
            ),
          ],
        );
      });
}
