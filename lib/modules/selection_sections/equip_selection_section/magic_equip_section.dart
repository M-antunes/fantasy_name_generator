import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/magic_item_controller.dart';

import '../../../controllers/equip_controller.dart';
import '../../../shared/constants/phone_sizes.dart';
import '../../../shared/themes/app_text_styles.dart';
import 'equip_generation.dart';
import 'widgets/general_magical_equip_row.dart';

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
                        ? "${state.char.charEquip.primaryWeapon!.enchantment?[1].power}"
                        : "Mundane",
                    style: AppTextStyle.statsLabel),
                const SizedBox(width: 6),
                Text("${state.char.charEquip.primaryWeapon!.name}",
                    style: AppTextStyle.subTextWhite),
                const SizedBox(width: 6),
                Text(
                    state.char.charEquip.primaryWeapon!.enchantment != null
                        ? "${state.char.charEquip.primaryWeapon!.enchantment?[0].power}"
                        : "",
                    style: AppTextStyle.subTextWhite),
                const SizedBox(width: 15),
              ],
            ),
            SizedBox(height: deviceHeight! * 0.004),
            Row(
              children: [
                Text("Damage ", style: AppTextStyle.statsLabel),
                const SizedBox(width: 6),
                Text("${state.char.charEquip.primaryWeapon!.damage}",
                    style: AppTextStyle.subTextWhite),
              ],
            ),
            if (state.isDualWield)
              Column(
                children: [
                  SizedBox(height: deviceHeight! * 0.02),
                  const EquipSectionModal(label: "Off-hand Weapon"),
                  SizedBox(height: deviceHeight! * 0.01),
                  Row(
                    children: [
                      Text(
                          state.char.charEquip.secondaryWeapon!.enchantment !=
                                  null
                              ? "${state.char.charEquip.secondaryWeapon!.enchantment?[1].power}"
                              : "Mundane",
                          style: AppTextStyle.statsLabel),
                      const SizedBox(width: 6),
                      Text("${state.char.charEquip.secondaryWeapon!.name}",
                          style: AppTextStyle.subTextWhite),
                      const SizedBox(width: 6),
                      Text(
                          state.char.charEquip.secondaryWeapon?.enchantment !=
                                  null
                              ? "${state.char.charEquip.secondaryWeapon!.enchantment?[0].power}"
                              : "",
                          style: AppTextStyle.subTextWhite),
                      const SizedBox(width: 15),
                    ],
                  ),
                  SizedBox(height: deviceHeight! * 0.004),
                  Row(
                    children: [
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
                    ],
                  ),
                  SizedBox(height: deviceHeight! * 0.004),
                  Row(
                    children: [
                      Text("AC bonus: ", style: AppTextStyle.statsLabel),
                      Text("(${state.char.charEquip.shield!.defenseBonus!})",
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
            SizedBox(height: deviceHeight! * 0.02),
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
              ],
            ),
            SizedBox(height: deviceHeight! * 0.004),
            Row(
              children: [
                Text("AC bonus: ", style: AppTextStyle.statsLabel),
                Text("(${state.char.charEquip.armour!.defenseBonus!})",
                    style: AppTextStyle.subTextWhite),
                const SizedBox(width: 6),
                Text("Max Dex ", style: AppTextStyle.statsLabel),
                const SizedBox(width: 3),
                Text("(${state.char.charEquip.armour!.maxDexAllowed!})",
                    style: AppTextStyle.subTextWhite),
              ],
            ),
            if (state.penaltyToDexApplied)
              Column(
                children: [
                  SizedBox(height: deviceHeight! * 0.004),
                  Row(
                    children: [
                      Text("Dex ", style: AppTextStyle.statsLabel),
                      Text("${state.char.baseAtributes.dexterity!}  ",
                          style: AppTextStyle.subTextWhite),
                      Text("(${state.char.modAtributes.dexterity!})",
                          style: AppTextStyle.penaltyStyle),
                      const SizedBox(width: 6),
                      Text("Penalty applied",
                          style: AppTextStyle.penaltyStyleText),
                    ],
                  ),
                ],
              ),
            SizedBox(height: deviceHeight! * 0.02),
            const EquipSectionModal(label: "Emergency Weapon"),
            SizedBox(height: deviceHeight! * 0.01),
            Row(
              children: [
                Text(
                    state.char.charEquip.emergencyWeapon!.enchantment != null
                        ? "${state.char.charEquip.emergencyWeapon!.enchantment?[1].power}"
                        : "Mundane",
                    style: AppTextStyle.statsLabel),
                const SizedBox(width: 6),
                Text("${state.char.charEquip.emergencyWeapon!.name}",
                    style: AppTextStyle.subTextWhite),
                const SizedBox(width: 6),
                Text(
                    state.char.charEquip.emergencyWeapon!.enchantment != null
                        ? "${state.char.charEquip.emergencyWeapon!.enchantment?[0].power}"
                        : "",
                    style: AppTextStyle.subTextWhite),
                const SizedBox(width: 15),
              ],
            ),
            SizedBox(height: deviceHeight! * 0.004),
            Row(
              children: [
                Text("Damage ", style: AppTextStyle.statsLabel),
                const SizedBox(width: 6),
                Text("${state.char.charEquip.emergencyWeapon!.damage}",
                    style: AppTextStyle.subTextWhite),
              ],
            ),
            SizedBox(height: deviceHeight! * 0.015),
            const EquipSectionModal(label: "General Magic Equipment"),
            SizedBox(height: deviceHeight! * 0.015),

            Consumer<MagicItemController>(builder: (context, ctrl, child) {
              ctrl.character = state.char;
              return ctrl.magicItemsGenerated
                  ? ListView.builder(
                      itemCount:
                          ctrl.character!.charEquip.wonderousItems!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var item =
                            ctrl.character!.charEquip.wonderousItems![index];
                        return GeneralMagicalEquipRow(
                          label: item.type!,
                          item: item.name!,
                          description: item.description!,
                          onTap: () => ctrl.showItemDescription(index),
                          selected: item.isSelected,
                        );
                      })
                  : const Center(
                      child: Text(
                        "?",
                        style: TextStyle(fontSize: 60, color: Colors.grey),
                      ),
                    );
            }),

            // Center(child: AppGenerateButton(onGenerate: () {})),
          ],
        ),
      );
    });
  }
}
