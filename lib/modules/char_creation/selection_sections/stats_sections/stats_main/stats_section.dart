import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/stage_controller/char_controller.dart';
import 'package:fantasy_name_generator/controllers/stats_controller/stats_controller.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:fantasy_name_generator/shared/widgets/app_horizontal_line.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../stats_tabs/ability_scores/ability_scores.dart';
import '../stats_tabs/combat/combat_stats.dart';
import '../stats_tabs/feats/feats_stats.dart';
import '../stats_tabs/features/features_stats.dart';
import '../stats_tabs/loot/loot_section.dart';
import '../stats_tabs/magic_gear/magic_gear_stats.dart';
import '../stats_tabs/skill/skill_stats.dart';
import '../stats_tabs/spell/spell_stats.dart';
import '../widgets/char_description_text.dart';

class StatsSection extends StatefulWidget {
  const StatsSection({
    Key? key,
  }) : super(key: key);

  @override
  State<StatsSection> createState() => _StatsSectionState();
}

class _StatsSectionState extends State<StatsSection>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 8, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Consumer<CharController>(builder: (context, state, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        state.cha.charName.fullName,
                        style: AppTextStyle.chosenName,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          state.isEpicLevelSelected
                              ? TextSpan(
                                  text: "Epic ", style: AppTextStyle.epicLabel)
                              : state.isLegendaryLevelSelected
                                  ? TextSpan(
                                      text: "Legendary ",
                                      style: AppTextStyle.epicLabel)
                                  : TextSpan(
                                      text: "",
                                      style: AppTextStyle.legendaryLabel),
                          TextSpan(
                              text: "lv: ", style: AppTextStyle.subTextWhite),
                          TextSpan(
                              text: state.cha.charLevel.toString(),
                              style: AppTextStyle.levelDisplayStatsPageText)
                        ],
                      ),
                    )
                  ],
                ),
                Consumer<StatsController>(builder: (context, ctrl, child) {
                  ctrl.char = state.cha;
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: deviceWidth! * 0.5,
                              child: CharDescriptionText(
                                label: "Race:",
                                textValue: ctrl.char.charRace.name,
                              )),
                          CharDescriptionText(
                              label: "Gender:",
                              textValue: ctrl.char.charName.gender),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: deviceWidth! * 0.5,
                              child: CharDescriptionText(
                                  label: "Class:",
                                  textValue: ctrl.char.charClass.name)),
                          CharDescriptionText(
                              label: "Alignment:",
                              textValue: ctrl.char.alignment.abreviation!),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: deviceWidth! * 0.5,
                              child: CharDescriptionText(
                                  label: "Height:",
                                  textValue:
                                      "${ctrl.char.charRace.height!.key} ft. ${ctrl.char.charRace.height!.value} in.")),
                          CharDescriptionText(
                              label: "Weight:",
                              textValue:
                                  "${ctrl.char.charRace.weight!.toInt()} lbs."),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: deviceWidth! * 0.5,
                              child: CharDescriptionText(
                                  label: "Age:",
                                  textValue: "${ctrl.char.charRace.age}")),
                          CharDescriptionText(
                              label: "Size:",
                              textValue: "${state.chosenRace.size}"),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: deviceWidth! * 0.5,
                              child: CharDescriptionText(
                                  label: "Vision:",
                                  textValue: state.chosenRace.vision!)),
                          CharDescriptionText(
                              label: "Perception:",
                              textValue: ctrl.charSkills.isNotEmpty
                                  ? "${ctrl.charSkills.firstWhere((element) => element.name == "Perception").finalValue}"
                                  : "0"),
                        ],
                      ),
                      const SizedBox(height: 3),
                      const AppHorizontalLine(),
                      SizedBox(height: deviceHeight! * 0.01),
                      SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            TabBar(
                              automaticIndicatorColorAdjustment: true,
                              isScrollable: true,
                              indicatorColor: AppColors.primaryOrange,
                              labelStyle: AppTextStyle.tabLabel,
                              unselectedLabelColor: AppColors.primaryText0,
                              unselectedLabelStyle: AppTextStyle.tabLabel
                                  .copyWith(fontWeight: FontWeight.w300),
                              labelColor: AppColors.primaryOrange,
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              controller: _controller,
                              tabs: const [
                                Text("ATRIBUTES"),
                                Text("COMBAT"),
                                Text("MAGIC GEAR"),
                                Text("FEATURES"),
                                Text("FEATS"),
                                Text("SKILLS"),
                                Text("SPELLS"),
                                Text("LOOT"),
                              ],
                            ),
                            SizedBox(
                              height: deviceHeight! * 0.56,
                              width: double.infinity,
                              child: TabBarView(
                                controller: _controller,
                                children: const [
                                  AbilityScoreSection(),
                                  CombatStats(),
                                  MagicGearStats(),
                                  FeatureStats(),
                                  FeatStats(),
                                  SkillStats(),
                                  SpellStats(),
                                  LootSection(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ],
            );
          }),
        ],
      ),
    );
  }
}