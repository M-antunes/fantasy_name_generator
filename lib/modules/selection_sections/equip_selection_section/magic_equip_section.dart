import 'package:fantasy_name_generator/shared/widgets/app_generate_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/equip_controller.dart';
import '../../../shared/constants/phone_sizes.dart';
import '../../../shared/themes/app_text_styles.dart';
import 'equip_generation.dart';

class MagicEquipSection extends StatelessWidget {
  const MagicEquipSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EquipController>(builder: (context, state, child) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceWidth! * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: deviceHeight! * 0.01),
            // const EquipSectionModal(label: "Ability Scores"),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     AtributeTile(
            //       atribute: "STR",
            //       value: state.char.baseAtributes.strength!,
            //       mod: state.char.modAtributes.strength!,
            //     ),
            //     AtributeTile(
            //       atribute: "DEX",
            //       value: state.char.baseAtributes.dexterity!,
            //       mod: state.char.modAtributes.dexterity!,
            //       penalty: state.penaltyToDexApplied
            //           ? AppTextStyle.penaltyStyle
            //           : null,
            //     ),
            //     AtributeTile(
            //       atribute: "CON",
            //       value: state.char.baseAtributes.constitution!,
            //       mod: state.char.modAtributes.constitution!,
            //     ),
            //     AtributeTile(
            //       atribute: "INT",
            //       value: state.char.baseAtributes.intelligence!,
            //       mod: state.char.modAtributes.intelligence!,
            //     ),
            //     AtributeTile(
            //       atribute: "WIS",
            //       value: state.char.baseAtributes.wisdom!,
            //       mod: state.char.modAtributes.wisdom!,
            //     ),
            //     AtributeTile(
            //       atribute: "CHA",
            //       value: state.char.baseAtributes.charisma!,
            //       mod: state.char.modAtributes.charisma!,
            //     ),
            //   ],
            // ),
            SizedBox(height: deviceHeight! * 0.01),
            const EquipSectionModal(label: "Primary Weapon"),
            SizedBox(height: deviceHeight! * 0.01),
            Row(
              children: [
                Text(
                    state.char.charEquip.primaryWeapon!.enchantment != null
                        ? "${state.char.charEquip.primaryWeapon!.enchantment?.power}"
                        : "Mundane",
                    style: AppTextStyle.statsLabel),
                const SizedBox(width: 6),
                Text("${state.char.charEquip.primaryWeapon!.name}",
                    style: AppTextStyle.subTextWhite),
                const SizedBox(width: 6),
                Text(
                    state.char.charEquip.primaryWeapon!.enchantment != null
                        ? "${state.char.charEquip.primaryWeapon!.enchantment?.power}"
                        : "",
                    style: AppTextStyle.subTextWhite),
                const SizedBox(width: 15),
                Text("Damage ", style: AppTextStyle.statsLabel),
                const SizedBox(width: 6),
                Text("${state.char.charEquip.primaryWeapon!.damage}",
                    style: AppTextStyle.subTextWhite),
              ],
            ),
            if (state.isDualWield || state.cantChooseTwoHandedAnymore)
              Column(
                children: [
                  SizedBox(height: deviceHeight! * 0.01),
                  const EquipSectionModal(label: "Off-hand Weapon"),
                  SizedBox(height: deviceHeight! * 0.01),
                  Row(
                    children: [
                      Text(
                          state.char.charEquip.secondaryWeapon!.enchantment !=
                                  null
                              ? "${state.char.charEquip.secondaryWeapon!.enchantment?.power}"
                              : "Mundane",
                          style: AppTextStyle.statsLabel),
                      const SizedBox(width: 6),
                      Text("${state.char.charEquip.secondaryWeapon!.name}",
                          style: AppTextStyle.subTextWhite),
                      const SizedBox(width: 6),
                      Text(
                          state.char.charEquip.secondaryWeapon!.enchantment !=
                                  null
                              ? "${state.char.charEquip.secondaryWeapon!.enchantment?.power}"
                              : "",
                          style: AppTextStyle.subTextWhite),
                      const SizedBox(width: 15),
                      Text("Damage ", style: AppTextStyle.statsLabel),
                      const SizedBox(width: 6),
                      Text("${state.char.charEquip.secondaryWeapon!.damage}",
                          style: AppTextStyle.subTextWhite),
                    ],
                  ),
                ],
              ),
            if (state.chosenShieldType != null)
              Column(
                children: [
                  SizedBox(height: deviceHeight! * 0.02),
                  const EquipSectionModal(label: "Shield"),
                  SizedBox(height: deviceHeight! * 0.01),
                  Row(
                    children: [
                      Text(
                          state.char.charEquip.shield!.enchantment != null
                              ? "${state.char.charEquip.shield!.enchantment?.power}"
                              : "Mundane",
                          style: AppTextStyle.statsLabel),
                      const SizedBox(width: 6),
                      Text(state.char.charEquip.shield!.name!,
                          style: AppTextStyle.subTextWhite),
                      const SizedBox(width: 10),
                      Text(
                          state.char.charEquip.shield!.enchantment != null
                              ? "${state.char.charEquip.shield!.enchantment?.power}"
                              : "",
                          style: AppTextStyle.subTextWhite),
                      const SizedBox(width: 10),
                      Text("Check penalty: ", style: AppTextStyle.statsLabel),
                      Text(
                          state.char.charEquip.shield!.checkPenalty! == 0
                              ? "(0)"
                              : "(-${state.char.charEquip.shield!.checkPenalty!})",
                          style: AppTextStyle.traitValue),
                    ],
                  ),
                ],
              ),
            SizedBox(height: deviceHeight! * 0.01),
            const EquipSectionModal(label: "Armor"),
            SizedBox(height: deviceHeight! * 0.01),
            Row(
              children: [
                Text(
                    state.char.charEquip.armour!.enchantment != null
                        ? "${state.char.charEquip.armour!.enchantment?.power}"
                        : "Mundane",
                    style: AppTextStyle.statsLabel),
                const SizedBox(width: 6),
                Text(state.char.charEquip.armour!.name!,
                    style: AppTextStyle.subTextWhite),
                const SizedBox(width: 10),
                Text(
                    state.char.charEquip.armour!.enchantment != null
                        ? "${state.char.charEquip.armour!.enchantment?.power}"
                        : "",
                    style: AppTextStyle.statsLabel),
                Text("(${state.char.charEquip.armour!.defenseBonus!})",
                    style: AppTextStyle.subTextWhite),
                const SizedBox(width: 6),
                Text("Max Dex ", style: AppTextStyle.statsLabel),
                const SizedBox(width: 3),
                Text("(${state.char.charEquip.armour!.maxDexAllowed!})",
                    style: AppTextStyle.subTextWhite),
              ],
            ),
            SizedBox(height: deviceHeight! * 0.015),
            const EquipSectionModal(label: "General Magic Equipment"),
            SizedBox(height: deviceHeight! * 0.015),
            GeneralEquipmentRow(
              rightLabel: "Belt:",
              leftLabel: "Body:",
            ),
            SizedBox(height: deviceHeight! * 0.015),
            GeneralEquipmentRow(
              rightLabel: "Chest:",
              leftLabel: "Eyes:",
            ),
            SizedBox(height: deviceHeight! * 0.015),
            GeneralEquipmentRow(
              rightLabel: "Feet:",
              leftLabel: "Hands:",
            ),
            SizedBox(height: deviceHeight! * 0.015),
            GeneralEquipmentRow(
              rightLabel: "Head:",
              leftLabel: "Headband:",
            ),
            SizedBox(height: deviceHeight! * 0.015),
            GeneralEquipmentRow(
              rightLabel: "L. Ring:",
              leftLabel: "Neck:",
            ),
            SizedBox(height: deviceHeight! * 0.015),
            GeneralEquipmentRow(
              rightLabel: "R. Ring:",
              leftLabel: "Shoulders:",
            ),
            SizedBox(height: deviceHeight! * 0.015),
            GeneralEquipmentRow(
              rightLabel: "Wrist:",
              leftLabel: "Slotless:",
            ),
            SizedBox(height: deviceHeight! * 0.015),
            Center(child: AppGenerateButton(onGenerate: () {})),
          ],
        ),
      );
    });
  }
}

class GeneralEquipmentRow extends StatelessWidget {
  final String rightLabel;
  final String leftLabel;
  final String? rightName;
  final String? leftName;
  const GeneralEquipmentRow({
    Key? key,
    required this.rightLabel,
    required this.leftLabel,
    this.rightName,
    this.leftName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: deviceWidth! * 0.47,
          child: Row(
            children: [
              Text(rightLabel, style: AppTextStyle.statsLabel),
              const SizedBox(width: 3),
              Text(rightName ?? "--", style: AppTextStyle.subTextWhite),
            ],
          ),
        ),
        Row(
          children: [
            Text(leftLabel, style: AppTextStyle.statsLabel),
            const SizedBox(width: 3),
            Text(leftName ?? "--", style: AppTextStyle.subTextWhite),
          ],
        ),
      ],
    );
  }
}
