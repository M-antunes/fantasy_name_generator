import 'package:fantasy_name_generator/modules/selection_sections/char_selection_sections/stats_sections/gear_stats.dart';
import 'package:fantasy_name_generator/shared/widgets/app_horizontal_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:fantasy_name_generator/shared/widgets/expanded_section.dart';

import '../../../shared/themes/app_colors.dart';
import '../../../shared/widgets/atribute_division.dart';
import 'stats_sections/ability_scores.dart';
import 'stats_sections/combat_stats.dart';
import 'stats_sections/features_stats.dart';
import 'widgets/char_description_column.dart';
import 'widgets/defense_info.dart';
import 'widgets/stats_description_column.dart';

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
    _controller = TabController(length: 4, vsync: this);
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
                SizedBox(height: deviceHeight! * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: deviceWidth! * 0.4,
                      child: CharDescriptionColumn(
                        labeltop: "Race:",
                        labelBottom: "Class:",
                        textValueTop: state.cha.charRace.name,
                        textValueBottom: state.cha.charClass.name,
                      ),
                    ),
                    SizedBox(
                      width: deviceWidth! * 0.5,
                      child: CharDescriptionColumn(
                        labeltop: "Gender:",
                        labelBottom: "Alignment:",
                        textValueTop: state.cha.charName.gender,
                        textValueBottom: state.cha.alignment.abreviation!,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: deviceWidth! * 0.4,
                      child: CharDescriptionColumn(
                        labeltop: "Height:",
                        labelBottom: "Weight:",
                        textValueTop:
                            "${state.cha.charRace.height!.key} ft. ${state.cha.charRace.height!.value} in.",
                        textValueBottom:
                            "${state.cha.charRace.weight!.toInt()} lbs.",
                      ),
                    ),
                    SizedBox(
                      width: deviceWidth! * 0.5,
                      child: CharDescriptionColumn(
                          labeltop: "Age:",
                          labelBottom: "Size:",
                          textValueTop: "${state.cha.charRace.age}",
                          textValueBottom: "${state.chosenRace.size}"),
                    ),
                  ],
                ),

                const AppHorizontalLine(),
                SizedBox(height: deviceHeight! * 0.01),
                TabBar(
                  padding: EdgeInsets.zero,
                  indicatorColor: AppColors.primaryOrange,
                  labelStyle: AppTextStyle.tabLabel,
                  unselectedLabelColor: AppColors.primaryText0,
                  unselectedLabelStyle: AppTextStyle.subTextGrey,
                  labelColor: AppColors.primaryOrange,
                  labelPadding: EdgeInsets.zero,
                  controller: _controller,
                  tabs: const [
                    Text("ATRIBUTES"),
                    Text("COMBAT"),
                    Text("FEATURES"),
                    Text("GEAR"),
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
                      FeatureStats(),
                      GearStats(),
                    ],
                  ),
                )

                // WeaponLabelSection(
                //   label: "Ability Scores",
                //   onTap: () {
                //     setState(() {
                //       showAbilityScore = !showAbilityScore;
                //     });
                //   },
                // ),
                // const AtributeDivision(
                //   label: "ABILITY SCORES  (base / modifier)",
                //   label2:
                //       "These values might be altered depending on equipment",
                // ),

                // ExpandedSection(
                //   expand: showAbilityScore,
                //   child: Row(
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           SizedBox(
                //             width: size.width * 0.44,
                //             child: StatsDescriptionColumn(
                //               labeltop: "Strength:",
                //               labelBottom: "Dexterity:",
                //               textValueTop: state.cha.baseAtributes.strength!,
                //               textValueBottom:
                //                   state.cha.baseAtributes.dexterity!,
                //               modTop: state.cha.modAtributes.strength!,
                //               modBottom: state.cha.modAtributes.dexterity!,
                //             ),
                //           ),
                //           SizedBox(
                //             width: size.width * 0.44,
                //             child: StatsDescriptionText(
                //               label: "Constitution:",
                //               textValue: state.cha.baseAtributes.constitution!,
                //               modValue: state.cha.modAtributes.constitution!,
                //             ),
                //           )
                //         ],
                //       ),
                //       SizedBox(width: size.width * 0.02),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           SizedBox(
                //             width: size.width * 0.44,
                //             child: StatsDescriptionColumn(
                //               labeltop: "Intelligence:",
                //               labelBottom: "Wisdom:",
                //               textValueTop:
                //                   state.cha.baseAtributes.intelligence!,
                //               textValueBottom: state.cha.baseAtributes.wisdom!,
                //               modTop: state.cha.modAtributes.intelligence!,
                //               modBottom: state.cha.modAtributes.wisdom!,
                //             ),
                //           ),
                //           SizedBox(
                //             width: size.width * 0.44,
                //             child: StatsDescriptionText(
                //               label: "Charisma:",
                //               textValue: state.cha.baseAtributes.charisma!,
                //               modValue: state.cha.modAtributes.charisma!,
                //             ),
                //           ),
                //           SizedBox(height: deviceHeight! * 0.006),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                // WeaponLabelSection(
                //   label: "Defense",
                //   onTap: () {
                //     setState(() {
                //       showDefense = !showDefense;
                //     });
                //   },
                // ),
                // ExpandedSection(
                //   expand: showDefense,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Row(
                //         children: [
                //           DefenseInfo(
                //             length: deviceWidth! * 0.59,
                //             label: "Hit Points:",
                //             value: "${state.cha.hitPoints}",
                //           ),
                //         ],
                //       ),
                //       Row(
                //         children: [
                //           DefenseInfo(
                //             label: "Fort:",
                //             value: "${state.cha.resistances.fortitude!}",
                //           ),
                //           SizedBox(width: size.width * 0.03),
                //           DefenseInfo(
                //             label: "Ref:",
                //             value: "${state.cha.resistances.reflex!}",
                //           ),
                //           SizedBox(width: size.width * 0.03),
                //           DefenseInfo(
                //             label: "Will:",
                //             value: "${state.cha.resistances.will!}",
                //           ),
                //         ],
                //       ),
                //       DefenseInfo(
                //         length: deviceWidth! * 0.9,
                //         label: "Armor:",
                //         value: "",
                //       ),
                //       Row(
                //         children: [
                //           DefenseInfo(
                //             label: "Touch:",
                //             value: "${state.cha.combatStats.armourTouch!}",
                //           ),
                //           SizedBox(width: size.width * 0.03),
                //           DefenseInfo(
                //             label: "Surp:",
                //             value: "${state.cha.combatStats.armourSurprise!}",
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                // WeaponLabelSection(
                //   label: "Offense",
                //   onTap: () {
                //     setState(() {
                //       showOffense = !showOffense;
                //     });
                //   },
                // ),
                // ExpandedSection(
                //   expand: showOffense,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       DefenseInfo(
                //         length: deviceWidth! * 0.59,
                //         label: "Base attack bonus:",
                //         value: "${state.cha.combatStats.baseAttackBonus!}",
                //       ),
                //       DefenseInfo(
                //         length: deviceWidth! * 0.9,
                //         label: "Melee:",
                //         value: "",
                //       ),
                //       DefenseInfo(
                //         length: deviceWidth! * 0.59,
                //         label: "Damage:",
                //         value: "",
                //       ),
                //     ],
                //   ),
                // ),
                // WeaponLabelSection(
                //   label: "Combat Manouvers",
                //   onTap: () {
                //     setState(() {
                //       showManouvers = !showManouvers;
                //     });
                //   },
                // ),

                // ExpandedSection(
                //   expand: showManouvers,
                //   child: Row(
                //     children: [
                //       DefenseInfo(
                //         label: "CMB:",
                //         value: "${state.cha.combatStats.combatManeuverBonus!}",
                //       ),
                //       SizedBox(width: size.width * 0.03),
                //       DefenseInfo(
                //         label: "CMD:",
                //         value:
                //             "${state.cha.combatStats.combatManeuverDefense!}",
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(height: size.height * 0.02),

                // if (!state.isCharGeneratorCleared)
                //   Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       RichText(
                //         textAlign: TextAlign.center,
                //         text: TextSpan(
                //           style: AppTextStyle.subTextGrey,
                //           children: [
                //             TextSpan(
                //                 text: state.cha.charName.fullName,
                //                 style: AppTextStyle.subTextWhite),
                //             const TextSpan(
                //               text: "  has no equipment so far.",
                //             ),
                //           ],
                //         ),
                //       ),
                //       Row(
                //         children: [
                //           Text("Click", style: AppTextStyle.subTextGrey),
                //           TextButton(
                //               child: const Text(
                //                 "HERE",
                //                 style: TextStyle(color: AppColors.primaryGold),
                //               ),
                //               onPressed: () {
                //                 showStartingOverConfirmation(context, state);
                //               }),
                //           Text("to start over",
                //               style: AppTextStyle.subTextGrey),
                //         ],
                //       ),
                //       Text("Or click next to start equipment generation",
                //           style: AppTextStyle.subTextGrey),
                //     ],
                //   ),
                // SizedBox(height: deviceHeight! * 0.01),
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
