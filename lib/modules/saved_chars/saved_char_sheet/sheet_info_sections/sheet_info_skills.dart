import 'package:flutter/material.dart';

import '../../../../models/char_personal_models/char_model.dart';
import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/app_horizontal_line.dart';
import '../../../../shared/widgets/expanded_section.dart';
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
                                width: deviceWidth! * 0.1,
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
                                      textScaleFactor: 0.8,
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
                              SizedBox(width: deviceWidth! * 0.03),
                              SizedBox(
                                width: deviceWidth! * 0.04,
                                child: Center(
                                  child: Text(
                                    "${skill.boostValue}",
                                    style: skill.boostValue > 0
                                        ? AppTextStyle.statsLabelBrighter
                                            .copyWith(
                                                color: AppColors.boostColor)
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
                RichText(
                    textScaleFactor: 0.9,
                    text: TextSpan(
                        style: AppTextStyle.statsLabel
                            .copyWith(fontStyle: FontStyle.italic),
                        children: const [
                          TextSpan(
                              text:
                                  "* Bigger font means those are favored class skills and have been granted 3 aditional points from start.")
                        ])),
                SizedBox(height: deviceHeight! * 0.004),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
