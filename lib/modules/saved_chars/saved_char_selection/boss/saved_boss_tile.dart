import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';

class SavedBossTile extends StatelessWidget {
  final int level;
  final String charName;
  final String gender;
  final String svg;
  final VoidCallback onTap;
  final String race;
  final String alignment;
  const SavedBossTile({
    Key? key,
    required this.level,
    required this.charName,
    required this.gender,
    required this.svg,
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
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryGold, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: Stack(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: deviceWidth! < 350 ? 22 : 26,
                    child: SvgPicture.asset(svg,
                        height: deviceWidth! < 350 ? 32 : 40),
                  ),
                  title: Text(charName,
                      style: AppTextStyle.statsLabel.copyWith(
                          fontSize: 20,
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w600)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(race, style: AppTextStyle.statsLabel),
                          const SizedBox(width: 10),
                          Text(gender, style: AppTextStyle.statsLabel)
                        ],
                      ),
                      Text(alignment, style: AppTextStyle.statsLabel),
                    ],
                  ),
                  trailing: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Lv ", style: AppTextStyle.classNotSelected),
                      TextSpan(
                          text: "$level",
                          style: AppTextStyle.savedSelectionLevelDisplay),
                    ]),
                  ),
                ),
                Positioned(
                  top: deviceHeight! * 0.046,
                  right: deviceWidth! * 0.15,
                  child: Transform(
                    transform: Matrix4.rotationZ(-0.35),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: const BorderSide(
                              color: AppColors.primaryGold, width: 1)),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text("Boss",
                            style: AppTextStyle.modefier.copyWith(
                                fontSize: 18, color: AppColors.primaryGold)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
