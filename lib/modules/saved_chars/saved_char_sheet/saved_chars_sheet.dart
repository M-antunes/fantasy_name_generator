import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';
import 'package:fantasy_name_generator/modules/saved_chars/saved_char_sheet/sheet_info_sections/sheet_info_features.dart';
import 'package:fantasy_name_generator/modules/saved_chars/saved_char_sheet/sheet_info_sections/sheet_info_loot.dart';
import 'package:fantasy_name_generator/modules/saved_chars/saved_char_sheet/sheet_info_sections/sheet_info_magic_equip.dart';
import 'package:fantasy_name_generator/modules/saved_chars/saved_char_sheet/sheet_info_sections/sheet_info_skills.dart';
import 'package:fantasy_name_generator/modules/saved_chars/saved_char_sheet/sheet_info_sections/sheet_info_spells.dart';
import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:provider/provider.dart';

import '../../../controllers/char_admin_controller/char_adimin_controller.dart';
import '../../../shared/constants/phone_sizes.dart';
import '../../char_creation/selection_sections/stats_sections/widgets/char_description_text.dart';
import 'sheet_info_sections/sheet_info_attribute.dart';
import 'sheet_info_sections/sheet_info_combat.dart';
import 'sheet_info_sections/sheet_info_feats.dart';
import 'widgets/IconsStatsButton.dart';

class SavedCharSheet extends StatelessWidget {
  const SavedCharSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var char = ModalRoute.of(context)!.settings.arguments as CharModel;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color.fromARGB(255, 68, 54, 1), Colors.grey[900]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child:
              Consumer<CharAdminController>(builder: (context, state, child) {
            state.initializingController();
            return Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(char.charName.fullName,
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
                                text: "${char.charLevel}",
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
                              child: CharDescriptionText(
                                label: "Race:",
                                textValue: char.charRace.name,
                              )),
                          CharDescriptionText(
                              label: "Gender:",
                              textValue: char.charName.gender),
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
                                  textValue: char.charClass.name)),
                          CharDescriptionText(
                              label: "Alignment:",
                              textValue: char.alignment.abreviation!),
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
                                      "${char.charRace.height!.key}. ft. ${char.charRace.height!.value} in.")),
                          CharDescriptionText(
                              label: "Weight:",
                              textValue: "${char.charRace.weight} lbs"),
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
                                  textValue: "${char.charRace.age}")),
                          CharDescriptionText(
                              label: "Size:", textValue: char.charRace.size),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: deviceWidth! * 0.5,
                              child: CharDescriptionText(
                                  label: "Senses:",
                                  textValue: char.charRace.senses)),
                          CharDescriptionText(
                              label: "Perception:",
                              textValue:
                                  "${char.skills.firstWhere((element) => element.name == 'Perception').finalValue}"),
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
                                        onTap: () => state.switchIconRow(
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
                                      ? SheetInfoAbilityScore(char: char)
                                      : state.tempIcon.iconlabel == "Combat"
                                          ? SheetInfoCombat(char: char)
                                          : state.tempIcon.iconlabel ==
                                                  "Equipment"
                                              ? SheetInfoMagicEquip(char: char)
                                              : state.tempIcon.iconlabel ==
                                                      "Features"
                                                  ? SheetInfoFeatures(
                                                      char: char)
                                                  : state.tempIcon.iconlabel ==
                                                          "Feats"
                                                      ? SheetInfoFeats(
                                                          char: char)
                                                      : state.tempIcon
                                                                  .iconlabel ==
                                                              "Skills"
                                                          ? SheetInfoSkills(
                                                              char: char)
                                                          : state.tempIcon
                                                                      .iconlabel ==
                                                                  "Spells"
                                                              ? SheetInfoSpells(
                                                                  char: char)
                                                              : SheetInfoLoot(
                                                                  char: char),
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
