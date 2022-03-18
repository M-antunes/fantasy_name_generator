import 'package:flutter/material.dart';

import '../themes/app_text_styles.dart';

Future<dynamic> callWarningWidget(BuildContext context, String text,
    String? notWarning, VoidCallback? onConfirm) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 6,
          title: Text(
            notWarning ?? "Warning",
            strutStyle: const StrutStyle(fontSize: 20),
            style: AppTextStyle.changeRace,
          ),
          content: Text(
            text,
            style: AppTextStyle.subTextGreyPlusSize,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
                onPressed: onConfirm,
                child: Text(
                  "Ok",
                  style: AppTextStyle.warningButtonConfirm,
                ))
          ],
        );
      });
}
