import 'package:flutter/material.dart';

import '../../../../models/char_personal_models/char_model.dart';
import '../../../../shared/constants/phone_sizes.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: deviceWidth! * 0.11,
                child: Text(
                  "Bonus",
                  style: AppTextStyle.longDescription.copyWith(fontSize: 11),
                ),
              ),
              SizedBox(
                  width: deviceWidth! * 0.34,
                  child: Text(
                    " Skill name",
                    style: AppTextStyle.longDescription.copyWith(fontSize: 11),
                  )),
              SizedBox(
                  width: deviceWidth! * 0.11,
                  child: Center(
                    child: Text(
                      "Atrb",
                      style:
                          AppTextStyle.longDescription.copyWith(fontSize: 11),
                    ),
                  )),
              SizedBox(
                  width: deviceWidth! * 0.11,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Points\nAdded",
                      style:
                          AppTextStyle.longDescription.copyWith(fontSize: 11),
                    ),
                  )),
              SizedBox(
                  width: deviceWidth! * 0.11,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Armor\nPenalty",
                      style:
                          AppTextStyle.longDescription.copyWith(fontSize: 11),
                    ),
                  )),
            ],
          ),
          const AppHorizontalLine(),
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
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.5),
                        child: Row(
                          children: [
                            SizedBox(
                              width: deviceWidth! * 0.08,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[900],
                                radius: 16,
                                child: Text(
                                  "${skill.finalValue}",
                                  style: AppTextStyle.statsLabelBrighter,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            SizedBox(
                                width: deviceWidth! * 0.35,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    skill.name.contains("Knowledge")
                                        ? "${skill.name.substring(0, 9)}\n${skill.name.substring(10)}"
                                        : skill.name,
                                    style: skill.initialClassSkill
                                        ? AppTextStyle.subTextWhitePlusSize
                                        : AppTextStyle.statsLabelBrighter,
                                    textScaleFactor: 0.9,
                                  ),
                                )),
                            SizedBox(
                                width: deviceWidth! * 0.14,
                                child: Center(
                                  child: Text(
                                    "${skill.atributeUsed.substring(0, 3)} (${skill.atrbValue})",
                                    style: AppTextStyle.statsLabelBrighter,
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                            SizedBox(
                                width: deviceWidth! * 0.1,
                                child: Text(
                                  "${skill.pointsAdded}",
                                  style: AppTextStyle.statsLabelBrighter,
                                  textAlign: TextAlign.center,
                                )),
                            SizedBox(
                                width: deviceWidth! * 0.1,
                                child: Text(
                                  skill.checkPenalty > 0
                                      ? "-${skill.checkPenalty}"
                                      : "  0",
                                  style: AppTextStyle.statsLabelBrighter,
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        ),
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
