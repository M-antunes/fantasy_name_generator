import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../../../shared/constants/phone_sizes.dart';
import '../../../../../../../shared/themes/app_text_styles.dart';

// ignore: must_be_immutable
class SkillRowWidget extends StatelessWidget {
  final String bonus;
  final String skillName;
  final String atrb;
  final String pointAdded;
  final int boost;
  final String armorPenalty;
  final int atrbValue;

  bool classSkill;

  SkillRowWidget({
    Key? key,
    required this.bonus,
    required this.skillName,
    required this.atrb,
    required this.pointAdded,
    required this.boost,
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
              width: deviceWidth! * 0.125,
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
            SizedBox(width: deviceWidth! * 0.03),
            SizedBox(
              width: deviceWidth! * 0.07,
              child: Center(
                child: Text(
                  "$boost",
                  style: boost > 0
                      ? AppTextStyle.statsLabelBrighter
                          .copyWith(color: AppColors.boostColor)
                      : AppTextStyle.statsLabelBrighter,
                ),
              ),
            ),
            SizedBox(width: deviceWidth! * 0.03),
            SizedBox(
              width: deviceWidth! * 0.07,
              child: Center(
                child: Text(
                  armorPenalty,
                  style: AppTextStyle.statsLabelBrighter,
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
