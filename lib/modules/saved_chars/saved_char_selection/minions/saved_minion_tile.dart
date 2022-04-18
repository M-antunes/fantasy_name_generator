import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';

import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';

class SavedMinionTile extends StatelessWidget {
  final int level;
  final String charName;
  final bool isMale;
  final VoidCallback onTap;
  final String race;
  final String alignment;
  const SavedMinionTile({
    Key? key,
    required this.level,
    required this.charName,
    required this.isMale,
    required this.onTap,
    required this.race,
    required this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          elevation: 10,
          child: ListTile(
            leading: CircleAvatar(
              radius: deviceWidth! < 350 ? 22 : 24,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(text: "Lv ", style: AppTextStyle.classNotSelected),
                  TextSpan(
                      text: "$level",
                      style: AppTextStyle.savedSelectionLevelDisplay),
                ]),
              ),
            ),
            title: Text(charName,
                style: AppTextStyle.statsLabel.copyWith(
                    fontSize: 20,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w600)),
            subtitle: Row(
              children: [
                Text(race, style: AppTextStyle.statsLabel),
                const SizedBox(width: 10),
                Text(alignment, style: AppTextStyle.statsLabel)
              ],
            ),
            trailing: Icon(
              isMale ? Icons.male : Icons.female,
              size: 30,
              color: AppColors.primaryText0,
            ),
          ),
        ),
      ),
    );
  }
}
