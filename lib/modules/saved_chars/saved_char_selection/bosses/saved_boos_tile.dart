import 'package:flutter/material.dart';

import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';

class SavedBossTile extends StatelessWidget {
  final int level;
  final String charName;
  final VoidCallback onTap;
  const SavedBossTile({
    Key? key,
    required this.level,
    required this.charName,
    required this.onTap,
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
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(text: "Lv ", style: AppTextStyle.classNotSelected),
                  TextSpan(
                      text: "$level",
                      style: AppTextStyle.selectRace.copyWith(
                          fontSize: 35, color: AppColors.primaryText)),
                ]),
              ),
            ),
            title: Text(charName,
                style: AppTextStyle.statsLabel.copyWith(
                    fontSize: 20,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }
}
