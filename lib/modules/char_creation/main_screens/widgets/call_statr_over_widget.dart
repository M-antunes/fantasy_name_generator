import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../shared/themes/app_text_styles.dart';

Future<dynamic> callStartOverConfirmation(BuildContext context,
    String className, String charName, VoidCallback? onConfirm) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 6,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                  strutStyle: const StrutStyle(height: 1.6),
                  textAlign: TextAlign.center,
                  text: TextSpan(style: AppTextStyle.subTextGrey, children: [
                    const TextSpan(text: "Confirm this and the "),
                    TextSpan(
                        text: " $className ",
                        style: AppTextStyle.subTextGreyPlusSize),
                    const TextSpan(text: " named "),
                    TextSpan(
                        text: " $charName ",
                        style: AppTextStyle.subTextGreyPlusSize),
                    TextSpan(
                        text: "\nwill be lost forever.",
                        style: AppTextStyle.subTextGreyPlusSize
                            .copyWith(color: AppColors.primaryOrange)),
                  ])),
              const SizedBox(height: 6),
              Text("Is that what you desire?",
                  style: AppTextStyle.subTextGreyPlusSize),
            ],
          ),
          actions: [
            TextButton(
                onPressed: onConfirm,
                child: Text("Yes", style: AppTextStyle.warningButtonDeny)),
          ],
        );
      });
}
