import 'package:fantasy_name_generator/controllers/stats_controller.dart';
import 'package:fantasy_name_generator/shared/widgets/app_horizontal_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

import '../../../shared/themes/app_colors.dart';
import 'stats_sections/ability_scores.dart';
import 'stats_sections/combat_stats.dart';
import 'stats_sections/feats_stats.dart';
import 'stats_sections/features_stats.dart';
import 'stats_sections/loot_section.dart';
import 'stats_sections/magic_gear_stats.dart';
import 'stats_sections/skill_stats.dart';
import 'stats_sections/spell_stats.dart';
import 'widgets/char_description_column.dart';

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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: deviceWidth! * 0.5,
                        child: CharDescriptionText(
                          label: "Race:",
                          textValue: state.cha.charRace.name,
                        )),
                    CharDescriptionText(
                        label: "Class:", textValue: state.cha.charClass.name),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: deviceWidth! * 0.5,
                        child: CharDescriptionText(
                            label: "Gender:",
                            textValue: state.cha.charName.gender)),
                    CharDescriptionText(
                        label: "Alignment:",
                        textValue: state.cha.alignment.abreviation!),
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
                                "${state.cha.charRace.height!.key} ft. ${state.cha.charRace.height!.value} in.")),
                    CharDescriptionText(
                        label: "Weight:",
                        textValue:
                            "${state.cha.charRace.weight!.toInt()} lbs."),
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
                            textValue: "${state.cha.charRace.age}")),
                    CharDescriptionText(
                        label: "Size:", textValue: "${state.chosenRace.size}"),
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
                    const CharDescriptionText(
                        label: "Perception:", textValue: "0"),
                  ],
                ),
                const SizedBox(height: 3),
                const AppHorizontalLine(),
                SizedBox(height: deviceHeight! * 0.01),
                Consumer<StatsController>(builder: (context, ctrl, child) {
                  ctrl.char = state.cha;
                  return Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        indicatorColor: AppColors.primaryOrange,
                        labelStyle: AppTextStyle.tabLabel,
                        unselectedLabelColor: AppColors.primaryText0,
                        unselectedLabelStyle: AppTextStyle.tabLabel
                            .copyWith(fontWeight: FontWeight.w300),
                        labelColor: AppColors.primaryOrange,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 6),
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
                        height: deviceHeight! * 0.55,
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

Future<dynamic> showStartingOverConfirmation(
    BuildContext context, CharController state) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              "ATENTION!",
              style: TextStyle(
                color: AppColors.primaryGold,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  "If you start over, the ${state.cha.charClass.name} ${state.cha.charName.fullName}, will be lost forever.",
                  style: AppTextStyle.subTextGrey,
                  textAlign: TextAlign.center),
              Text("Is that what you desire?", style: AppTextStyle.subTextGrey),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                state.startCharAllOver();
                Navigator.of(context).pop();
              },
              child: const Text(
                'YES',
                style: TextStyle(color: AppColors.primary),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'NO',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        );
      });
}

class WeaponLabelSection extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const WeaponLabelSection({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              width: deviceWidth! * 0.93,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Chip(
              label: Text(label, style: AppTextStyle.weaponCategoryText),
            ),
          ],
        ),
        onTap: onTap);
  }
}

class EquipSectionModal extends StatelessWidget {
  final String label;
  const EquipSectionModal({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        height: deviceHeight! * 0.03,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColors.primaryText0,
          Colors.transparent,
        ], begin: Alignment.centerLeft, end: Alignment.bottomRight)),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(label, style: AppTextStyle.subTextWhite),
            )),
      ),
    );
  }
}
