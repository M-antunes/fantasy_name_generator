import 'package:fantasy_name_generator/modules/saved_chars/saved_char_sheet/controller/saved_char_controller.dart';
import 'package:fantasy_name_generator/modules/saved_chars/saved_char_sheet/sheet_info_sections/sheet_info_features.dart';
import 'package:fantasy_name_generator/modules/saved_chars/saved_char_sheet/sheet_info_sections/sheet_info_loot.dart';
import 'package:fantasy_name_generator/modules/saved_chars/saved_char_sheet/sheet_info_sections/sheet_info_magic_equip.dart';
import 'package:fantasy_name_generator/modules/saved_chars/saved_char_sheet/sheet_info_sections/sheet_info_skills.dart';
import 'package:fantasy_name_generator/modules/saved_chars/saved_char_sheet/sheet_info_sections/sheet_info_spells.dart';
import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:provider/provider.dart';

import '../../../shared/constants/phone_sizes.dart';
import '../../selection_sections/stats_sections/widgets/char_description_text.dart';
import 'sheet_info_sections/sheet_info_ability_score.dart';
import 'sheet_info_sections/sheet_info_combat.dart';
import 'sheet_info_sections/sheet_info_feats.dart';
import 'widgets/IconsStatsButton.dart';

class SavedCharSheet extends StatelessWidget {
  const SavedCharSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.blueGrey[900]!, Colors.grey[900]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child:
              Consumer<SavedCharController>(builder: (context, state, child) {
            state.initializingController();
            return Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Char name",
                          style: AppTextStyle.nameExhibitionSheet),
                      RichText(
                        text: TextSpan(
                          children: [
                            // state.isEpicLevelSelected
                            //     ? TextSpan(
                            //         text: "Epic ", style: AppTextStyle.epicLabel)
                            //     : state.isLegendaryLevelSelected
                            //         ? TextSpan(
                            //             text: "Legendary ",
                            //             style: AppTextStyle.epicLabel)
                            //         : TextSpan(
                            //             text: "",
                            //             style: AppTextStyle.legendaryLabel),
                            TextSpan(
                                text: "lv: ", style: AppTextStyle.subTextWhite),
                            TextSpan(
                                text: "10",
                                style: AppTextStyle.levelDisplayStatsPageText)
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: deviceWidth! * 0.5,
                              child: const CharDescriptionText(
                                label: "Race:",
                                textValue: "Example",
                              )),
                          const CharDescriptionText(
                              label: "Gender:", textValue: "Example"),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: deviceWidth! * 0.5,
                              child: const CharDescriptionText(
                                  label: "Class:", textValue: "Example")),
                          const CharDescriptionText(
                              label: "Alignment:", textValue: "Example"),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: deviceWidth! * 0.5,
                              child: const CharDescriptionText(
                                  label: "Height:",
                                  textValue: "Ex. ft. Ex. in.")),
                          const CharDescriptionText(
                              label: "Weight:", textValue: "Example lib"),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: deviceWidth! * 0.5,
                              child: const CharDescriptionText(
                                  label: "Age:", textValue: "Example")),
                          const CharDescriptionText(
                              label: "Size:", textValue: "Example"),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: deviceWidth! * 0.5,
                              child: const CharDescriptionText(
                                  label: "Vision:", textValue: "Example")),
                          const CharDescriptionText(
                              label: "Perception:", textValue: "Example"),
                        ],
                      ),
                      const SizedBox(height: 3),
                      SizedBox(height: deviceHeight! * 0.01),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: deviceWidth! < 350
                                    ? deviceWidth! * 0.2
                                    : deviceWidth! * 0.15,
                                child: ListView.builder(
                                    itemCount: state.allIcons.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      var icon = state.allIcons[index];
                                      return IconStatsButton(
                                        svg: icon.iconSvg,
                                        isSelected: icon.isSelected,
                                        onTap: () => state.showDescriptions(
                                            index, state.allIcons),
                                      );
                                    }),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: deviceWidth! < 350
                                ? deviceWidth! * 0.76
                                : deviceWidth! * 0.8,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Column(
                                children: [
                                  state.tempIcon.iconlabel == "Ability Scores"
                                      ? const SheetInfoAbilityScore()
                                      : state.tempIcon.iconlabel == "Combat"
                                          ? const SheetInfoCombat()
                                          : state.tempIcon.iconlabel ==
                                                  "Equipment"
                                              ? const SheetInfoMagicEquip()
                                              : state.tempIcon.iconlabel ==
                                                      "Features"
                                                  ? const SheetInfoFeatures()
                                                  : state.tempIcon.iconlabel ==
                                                          "Feats"
                                                      ? const SheetInfoFeats()
                                                      : state.tempIcon
                                                                  .iconlabel ==
                                                              "Skills"
                                                          ? const SheetInfoSkills()
                                                          : state.tempIcon
                                                                      .iconlabel ==
                                                                  "Spells"
                                                              ? const SheetInfoSpells()
                                                              : const SheetInfoLoot(),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
