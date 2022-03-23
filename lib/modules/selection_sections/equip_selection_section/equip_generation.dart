import 'package:fantasy_name_generator/shared/widgets/app_generate_button.dart';
import 'package:fantasy_name_generator/shared/widgets/atribute_division.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/equip_controller.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

import '../../../shared/constants/phone_sizes.dart';
import '../char_selection_sections/widgets/defense_info.dart';
import 'widgets/chosen_equip_display.dart';

class EquipGeneration extends StatelessWidget {
  const EquipGeneration({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Consumer<EquipController>(builder: (context, state, child) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceWidth! * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: deviceHeight! * 0.02),
            const Center(child: AtributeDivision(label: "Ability Scores")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AtributeTile(
                  atribute: "STR",
                  value: state.char.baseAtributes.strength!,
                  mod: state.char.modAtributes.strength!,
                ),
                AtributeTile(
                  atribute: "DEX",
                  value: state.char.baseAtributes.dexterity!,
                  mod: state.char.modAtributes.dexterity!,
                ),
                AtributeTile(
                  atribute: "CON",
                  value: state.char.baseAtributes.constitution!,
                  mod: state.char.modAtributes.constitution!,
                ),
                AtributeTile(
                  atribute: "INT",
                  value: state.char.baseAtributes.intelligence!,
                  mod: state.char.modAtributes.intelligence!,
                ),
                AtributeTile(
                  atribute: "WIS",
                  value: state.char.baseAtributes.wisdom!,
                  mod: state.char.modAtributes.wisdom!,
                ),
                AtributeTile(
                  atribute: "CHA",
                  value: state.char.baseAtributes.charisma!,
                  mod: state.char.modAtributes.charisma!,
                ),
              ],
            ),
            Stack(
              children: [
                Column(
                  children: [
                    const Center(
                      child: AtributeDivision(label: "Combat"),
                    ),
                    Row(
                      children: [
                        DefenseInfo(
                          label: "HP:",
                          value: state.char.hitPoints,
                        ),
                        SizedBox(width: deviceWidth! * 0.03),
                        DefenseInfo(
                          label: "Initiative",
                          value: state.char.modAtributes.dexterity!,
                        ),
                        SizedBox(width: deviceWidth! * 0.03),
                      ],
                    ),
                  ],
                ),
                Positioned(
                    right: 0,
                    top: 0,
                    child: AppGenerateButton(
                        onGenerate: () => state.generateEquip())),
              ],
            ),
            Row(
              children: [
                DefenseInfo(
                  label: "FORT:",
                  value: state.char.resistances.fortitude!,
                ),
                SizedBox(width: deviceWidth! * 0.03),
                DefenseInfo(
                  label: "REF:",
                  value: state.char.resistances.reflex!,
                ),
                SizedBox(width: deviceWidth! * 0.03),
                DefenseInfo(
                  label: "WILL:",
                  value: state.char.resistances.will!,
                ),
              ],
            ),
            Row(
              children: [
                DefenseInfo(
                  label: "AC:",
                  value: state.char.combatStats.armourClass!,
                ),
                SizedBox(width: deviceWidth! * 0.03),
                DefenseInfo(
                  label: "Touch:",
                  value: state.char.combatStats.armourTouch!,
                ),
                SizedBox(width: deviceWidth! * 0.03),
                DefenseInfo(
                  label: "Surp:",
                  value: state.char.combatStats.armourSurprise!,
                ),
              ],
            ),
            // const Center(child: AtributeDivision(label: "Combat Offense")),
            Row(
              children: [
                DefenseInfo(
                  label: "BAB:",
                  value: state.char.combatStats.baseAttackBonus!,
                ),
                SizedBox(width: deviceWidth! * 0.03),
                DefenseInfo(
                  label: "CMB:",
                  value: state.char.combatStats.combatManeuverBonus!,
                ),
                SizedBox(width: deviceWidth! * 0.03),
                DefenseInfo(
                  label: "CMD:",
                  value: state.char.combatStats.combatManeuverDefense!,
                ),
              ],
            ),
            SizedBox(height: deviceHeight! * 0.01),
            if (state.equipGenerated)
              Column(
                children: [
                  Row(
                    children: [
                      Text("Weapon: ", style: AppTextStyle.statsLabel),
                      Text(state.char.charEquip.primaryWeapon!.name!,
                          style: AppTextStyle.subTextWhite),
                      const SizedBox(width: 3),
                      Text(state.char.combatStats.primaryAttack!,
                          style: AppTextStyle.subTextWhite),
                      const SizedBox(width: 3),
                    ],
                  ),
                  SizedBox(height: deviceHeight! * 0.01),
                  Row(
                    children: [
                      Text("Damage: ", style: AppTextStyle.statsLabel),
                      Text(state.char.combatStats.primaryDamage!,
                          style: AppTextStyle.traitValue),
                      const SizedBox(width: 15),
                      Text("Critical: ", style: AppTextStyle.statsLabel),
                      Text(state.char.charEquip.primaryWeapon!.critical!,
                          style: AppTextStyle.traitValue),
                    ],
                  ),
                  SizedBox(height: deviceHeight! * 0.01),
                  Row(
                    children: [
                      Text("Damage type: ", style: AppTextStyle.statsLabel),
                      Text(state.char.charEquip.primaryWeapon!.damageType!,
                          style: AppTextStyle.traitValue),
                    ],
                  ),
                  SizedBox(height: deviceHeight! * 0.01),
                  Row(
                    children: [
                      Text("Armor: ", style: AppTextStyle.statsLabel),
                      Text(state.char.charEquip.armour!.name!,
                          style: AppTextStyle.subTextWhite),
                      const SizedBox(width: 3),
                      Text("(${state.char.charEquip.armour!.defenseBonus!})",
                          style: AppTextStyle.subTextWhite),
                      const SizedBox(width: 3),
                      Text("Max dex: ", style: AppTextStyle.statsLabel),
                      Text("(${state.char.charEquip.armour!.maxDexAllowed!})",
                          style: AppTextStyle.subTextWhite),
                    ],
                  ),
                ],
              ),
          ],
        ),
      );
    });
  }
}

class AtributeTile extends StatelessWidget {
  final String atribute;
  final int value;
  final int mod;
  const AtributeTile({
    Key? key,
    required this.atribute,
    required this.value,
    required this.mod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight! * 0.07,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(atribute, style: AppTextStyle.subTextWhitePlusSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$value  ", style: AppTextStyle.subTextGrey),
              Text("($mod)", style: AppTextStyle.subTextWhite),
            ],
          )
        ],
      ),
    );
  }
}
