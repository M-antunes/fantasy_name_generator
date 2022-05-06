import 'package:flutter/material.dart';

import '../../../../models/char_personal_models/char_model.dart';
import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/app_horizontal_line.dart';
import '../../../../shared/widgets/expanded_section.dart';
import '../../../char_creation/selection_sections/stats_sections/stats_tabs/skill/widget/skill_bottom_info.dart';
import 'widgets/label_for_category_icon.dart';

class SheetInfoSkills extends StatelessWidget {
  final CharModel char;

  const SheetInfoSkills({
    Key? key,
    required this.char,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandedSection(
      expand: true,
      child: Column(
        children: [
          const LabelForCategoryIcon(label: "Skills"),
          const AppHorizontalLine(),
          SizedBox(height: deviceHeight! * 0.004),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: deviceWidth! * 0.44,
                child: Row(
                  children: [
                    SizedBox(
                      width: deviceWidth! * 0.1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Bonus",
                          style: AppTextStyle.skillClassLabel,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Text(
                      "Skill name",
                      style: AppTextStyle.skillClassLabel,
                    ),
                  ],
                ),
              ),
              Text(
                "Atrbt",
                style: AppTextStyle.skillClassLabel,
                textAlign: TextAlign.center,
              ),
              Text(
                "Points\nAdded",
                style: AppTextStyle.skillClassLabel,
                textAlign: TextAlign.center,
              ),
              Text(
                "Boost",
                style: AppTextStyle.skillClassLabel,
                textAlign: TextAlign.center,
              ),
              Text(
                "Armor\npenalty",
                style: AppTextStyle.skillClassLabel,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const AppHorizontalLine(),
          SizedBox(height: deviceHeight! * 0.004),
          SizedBox(
            height: deviceHeight! * 0.6,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: char.skills.length,
                    itemBuilder: (context, index) {
                      var skill = char.skills[index];
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: deviceWidth! * 0.43,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: deviceWidth! * 0.09,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.grey[900],
                                          radius: 16,
                                          child: Text(
                                            "${skill.finalValue}",
                                            style:
                                                AppTextStyle.statsLabelBrighter,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3),
                                      child: SizedBox(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            skill.name.contains("Knowledge")
                                                ? "${skill.name.substring(0, 9)}\n${skill.name.substring(10)}"
                                                : skill.name,
                                            style: skill.initialClassSkill
                                                ? AppTextStyle
                                                    .subTextWhitePlusSize
                                                : AppTextStyle
                                                    .statsLabelBrighter,
                                            textScaleFactor: (skill.name
                                                        .contains(
                                                            "Knowledge") ||
                                                    skill.name
                                                        .contains("Sleight") ||
                                                    skill.name
                                                        .contains("Device"))
                                                ? 0.8
                                                : 0.9,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: deviceWidth! * 0.105,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      skill.attributeUsed.substring(0, 3),
                                      textScaleFactor: 0.8,
                                      style: AppTextStyle.statsLabelBrighter,
                                    ),
                                    Text(
                                      "(${skill.atrbValue})",
                                      textScaleFactor:
                                          skill.atrbValue > 9 ? 0.7 : 0.8,
                                      style: AppTextStyle.statsLabelBrighter,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: deviceWidth! * 0.03),
                              SizedBox(
                                width: deviceWidth! * 0.05,
                                child: Center(
                                  child: Text(
                                    "${skill.pointsAdded}",
                                    textScaleFactor: 0.8,
                                    style: AppTextStyle.statsLabelBrighter,
                                  ),
                                ),
                              ),
                              SizedBox(width: deviceWidth! * 0.02),
                              SizedBox(
                                width: deviceWidth! * 0.08,
                                child: Center(
                                  child: skill.initialClassSkill
                                      ? RichText(
                                          textScaleFactor:
                                              skill.itemBoostValue > 0
                                                  ? 0.7
                                                  : 0.8,
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: skill.itemBoostValue > 0
                                                  ? "+${skill.itemBoostValue}"
                                                  : "",
                                              style: skill.itemBoostValue > 0
                                                  ? AppTextStyle
                                                      .statsLabelBrighter
                                                      .copyWith(
                                                          color: AppColors
                                                              .boostColor)
                                                  : AppTextStyle
                                                      .statsLabelBrighter,
                                            ),
                                            TextSpan(
                                              text: skill.raceBoostValue > 0
                                                  ? "+${skill.raceBoostValue}"
                                                  : "",
                                              style: skill.raceBoostValue > 0
                                                  ? AppTextStyle
                                                      .statsLabelBrighter
                                                      .copyWith(
                                                          color: AppColors
                                                              .raceBoostColor)
                                                  : AppTextStyle
                                                      .statsLabelBrighter,
                                            ),
                                            TextSpan(
                                                text: "+3",
                                                style: AppTextStyle
                                                    .statsLabelBrighter
                                                    .copyWith(
                                                        color: AppColors
                                                            .primaryGold)),
                                          ]))
                                      : Text(
                                          "${skill.itemBoostValue}",
                                          style: skill.itemBoostValue > 0
                                              ? AppTextStyle.statsLabelBrighter
                                                  .copyWith(
                                                      color:
                                                          AppColors.boostColor)
                                              : AppTextStyle.statsLabelBrighter,
                                          textScaleFactor: 0.8,
                                        ),
                                ),
                              ),
                              SizedBox(width: deviceWidth! * 0.03),
                              SizedBox(
                                width: deviceWidth! * 0.04,
                                child: Center(
                                  child: Text(
                                    "${skill.checkPenalty}",
                                    style: AppTextStyle.statsLabelBrighter,
                                    textScaleFactor: 0.8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: deviceHeight! * 0.005),
                        ],
                      );
                    }),
                SizedBox(height: deviceHeight! * 0.004),
                const AppHorizontalLine(),
                SizedBox(height: deviceHeight! * 0.002),
                const SkillBottomInfo(
                    text: "* Bigger font means those are favored class skills"),
                const SkillBottomInfo(
                    coloredIndex: "◘",
                    color: AppColors.primaryGold,
                    text: " Represents the favored class boost to skill"),
                const SkillBottomInfo(
                    coloredIndex: "◘",
                    color: AppColors.raceBoostColor,
                    text: " Represents the race boost to skill"),
                const SkillBottomInfo(
                    coloredIndex: "◘",
                    color: AppColors.boostColor,
                    text: " Represents the item boost to skill"),
                SizedBox(height: deviceHeight! * 0.004),
                SizedBox(height: deviceHeight! * 0.004),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
