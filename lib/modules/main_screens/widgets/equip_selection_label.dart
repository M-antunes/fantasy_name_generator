import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class EquipSelectionLabel extends StatelessWidget {
  final Size size;
  final String label;
  final CharModel char;
  const EquipSelectionLabel({
    Key? key,
    required this.size,
    required this.label,
    required this.char,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.005, horizontal: size.height * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyle.mainPageLabel,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTextStyle.subTextGreyPlusSize,
              children: [
                // TextSpan(text: "  (${char.charClass.name})"),
                if (char.charLevel > 20 && char.charLevel < 26)
                  const TextSpan(text: " Epic", style: AppTextStyle.epicLabel),
                if (char.charLevel > 25)
                  const TextSpan(
                      text: " Legendary", style: AppTextStyle.legendaryLabel),
                TextSpan(
                    text: " (${char.charLevel})",
                    style: AppTextStyle.levelDisplayEquipPageText),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
