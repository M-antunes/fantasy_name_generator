import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/stats_controller/stats_controller.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/widgets/app_horizontal_line.dart';

import 'widget/skill_bottom_info.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: SkillRowLabelWidget(),
          ),
          const AppHorizontalLine(),
          SizedBox(height: deviceHeight! * 0.004),
          SizedBox(
            height: deviceHeight! * 0.49,
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
                        atrb: skill.attributeUsed,
                        atrbValue: skill.atrbValue,
                        pointAdded: "${skill.pointsAdded}",
                        itemBoost: skill.itemBoostValue,
                        raceBoost: skill.raceBoostValue,
                        armorPenalty: skill.checkPenalty,
                        classSkill: skill.initialClassSkill,
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
              ],
            ),
          ),
        ],
      );
    });
  }
}
