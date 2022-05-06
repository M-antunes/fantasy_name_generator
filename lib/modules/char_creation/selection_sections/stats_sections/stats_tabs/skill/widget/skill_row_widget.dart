import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/shared/themes/app_colors.dart';

import '../../../../../../../shared/constants/phone_sizes.dart';
import '../../../../../../../shared/themes/app_text_styles.dart';

// ignore: must_be_immutable
class SkillRowWidget extends StatelessWidget {
  final String bonus;
  final String skillName;
  final String atrb;
  final String pointAdded;
  final int itemBoost;
  final int raceBoost;
  final int armorPenalty;
  final int atrbValue;

  bool classSkill;

  SkillRowWidget({
    Key? key,
    required this.bonus,
    required this.skillName,
    required this.atrb,
    required this.pointAdded,
    required this.itemBoost,
    required this.raceBoost,
    required this.armorPenalty,
    required this.atrbValue,
    this.classSkill = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: deviceWidth! * 0.48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: deviceWidth! * 0.11,
                    child: Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[900],
                        radius: 16,
                        child: Text(
                          bonus,
                          style: AppTextStyle.statsLabelBrighter,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: SizedBox(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          skillName.contains("Knowledge")
                              ? "${skillName.substring(0, 9)}\n${skillName.substring(10)}"
                              : skillName,
                          style: classSkill
                              ? AppTextStyle.subTextWhitePlusSize
                              : AppTextStyle.statsLabelBrighter,
                          textScaleFactor: (skillName.contains("Knowledge") ||
                                  skillName.contains("Sleight") ||
                                  skillName.contains("Device"))
                              ? 0.9
                              : 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: deviceWidth! * 0.13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    atrb.substring(0, 3),
                    style: AppTextStyle.statsLabelBrighter,
                  ),
                  Text(
                    "($atrbValue)",
                    style: AppTextStyle.statsLabelBrighter,
                    textScaleFactor: atrbValue > 9 ? 0.8 : 1,
                  ),
                ],
              ),
            ),
            SizedBox(width: deviceWidth! * 0.05),
            SizedBox(
              width: deviceWidth! * 0.05,
              child: Center(
                child: Text(
                  pointAdded,
                  style: AppTextStyle.statsLabelBrighter,
                ),
              ),
            ),
            SizedBox(width: deviceWidth! * 0.02),
            SizedBox(
              width: deviceWidth! * 0.1,
              child: Center(
                child: classSkill
                    ? RichText(
                        textScaleFactor: itemBoost > 0 ? 0.8 : 0.9,
                        text: TextSpan(children: [
                          TextSpan(
                            text: itemBoost > 0 ? "+$itemBoost" : "",
                            style: itemBoost > 0
                                ? AppTextStyle.statsLabelBrighter
                                    .copyWith(color: AppColors.boostColor)
                                : AppTextStyle.statsLabelBrighter,
                          ),
                          TextSpan(
                              text: raceBoost > 0 ? "+$raceBoost" : "",
                              style: AppTextStyle.statsLabelBrighter
                                  .copyWith(color: AppColors.raceBoostColor)),
                          TextSpan(
                              text: "+3",
                              style: AppTextStyle.statsLabelBrighter
                                  .copyWith(color: AppColors.primaryGold)),
                        ]))
                    : Text(
                        "$itemBoost",
                        style: itemBoost > 0
                            ? AppTextStyle.statsLabelBrighter
                                .copyWith(color: AppColors.boostColor)
                            : AppTextStyle.statsLabelBrighter,
                      ),
              ),
            ),
            SizedBox(width: deviceWidth! * 0.01),
            SizedBox(
              width: deviceWidth! * 0.07,
              child: Center(
                child: Text(
                  armorPenalty > 0 ? "-$armorPenalty" : "0",
                  style: armorPenalty > 0
                      ? AppTextStyle.statsLabelBrighter
                          .copyWith(color: AppColors.primary)
                      : AppTextStyle.statsLabelBrighter,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: deviceHeight! * 0.005),
      ],
    );
  }
}
