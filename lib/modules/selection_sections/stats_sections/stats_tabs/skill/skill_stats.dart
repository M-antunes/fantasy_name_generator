import 'package:fantasy_name_generator/shared/widgets/app_horizontal_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/stats_controller.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';

import 'widget/skill_row_label_widget.dart';
import 'widget/skill_row_widget.dart';

class SkillStats extends StatelessWidget {
  const SkillStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatsController>(builder: (context, state, child) {
      return Column(
        children: [
          SizedBox(height: deviceHeight! * 0.005),
          const AppHorizontalLine(),
          SizedBox(height: deviceHeight! * 0.004),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: SkillRowLabelWidget(
              bonus: "Bonus",
              skillName: "Skill name",
              atrb: "Atrbt",
              pointAdded: "Points\nAdded",
              armorPenalty: "Armor\npenalty",
            ),
          ),
          const AppHorizontalLine(),
          SizedBox(height: deviceHeight! * 0.004),
          SizedBox(
            height: deviceHeight! * 0.48,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.charSkills.length,
                    itemBuilder: (context, index) {
                      var skill = state.charSkills[index];
                      return SkillRowWidget(
                        bonus: "${skill.finalValue}",
                        skillName: skill.name,
                        atrb: skill.atributeUsed,
                        atrbValue: skill.atrbValue,
                        pointAdded: "${skill.pointsAdded}",
                        armorPenalty: skill.checkPenalty > 0
                            ? "-${skill.checkPenalty}"
                            : "  0",
                        classSkill: skill.initialClassSkill,
                      );
                    }),
              ],
            ),
          ),
        ],
      );
    });
  }
}
