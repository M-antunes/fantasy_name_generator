import 'package:flutter/material.dart';

import '../../../../shared/themes/app_text_styles.dart';

Future<dynamic> confirmSave(
    BuildContext context, String name, String className, VoidCallback onSave) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            "Confirm to save $name to your list of ${className}s.",
            style: AppTextStyle.subTextGreyPlusSize,
            strutStyle: const StrutStyle(height: 1.5),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
                onPressed: onSave,
                child: Text(
                  "Yes",
                  style: AppTextStyle.legendaryLabel,
                ))
          ],
        );
      });
}
