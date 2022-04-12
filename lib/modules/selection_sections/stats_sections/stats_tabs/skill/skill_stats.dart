import 'package:fantasy_name_generator/shared/widgets/app_horizontal_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/stats_controller.dart';
import 'package:fantasy_name_generator/modules/selection_sections/stats_sections/widgets/atribute_division.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';

import 'widget/skill_row_widget.dart';

class SkillStats extends StatelessWidget {
  const SkillStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatsController>(builder: (context, state, child) {
      return ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const AtributeDivision(label: "Skills"),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: SkillRowWidget(
              isNotLabel: false,
              bonus: "Bonus",
              skillName: "Skill name",
              atrb: "Atrbt",
              pointAdded: "Points\nAdded",
              armorPenalty: "Armor\npenalty",
            ),
          ),
          const AppHorizontalLine(),
          SizedBox(height: deviceHeight! * 0.004),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 8,
              itemBuilder: (context, index) {
                return SkillRowWidget(
                  bonus: "0",
                  skillName: "Example of skill",
                  atrb: "dex",
                  pointAdded: "0",
                  armorPenalty: "0",
                );
              })
        ],
      );
    });
  }
}
