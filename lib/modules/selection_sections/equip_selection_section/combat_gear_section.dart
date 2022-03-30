import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/equip_controller.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/widgets/app_animated_button.dart';

import '../../../shared/themes/app_colors.dart';
import '../../../shared/themes/app_text_styles.dart';
import 'equip_generation.dart';
import 'widgets/chosen_equip_display.dart';
import 'widgets/equip_display_choice_row.dart';
import 'widgets/off_hand_display_row.dart';

class CombatGearSection extends StatelessWidget {
  const CombatGearSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EquipController>(builder: (context, state, child) {
      return Column(
        children: [
          SizedBox(height: deviceHeight! * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              state.isDualWield
                  ? ChosenEquipDisplay(
                      size: deviceWidth! < 400 ? 90 : 105,
                      color: AppColors.primary,
                      equipType:
                          "Dual Weild\n${state.chosenPrimaryWeaponType!.name} & ${state.chosenSecondaryWeaponType!.name}",
                      weapon: DualWeildIcon(state: state),
                    )
                  : state.displayTwoHandedIcon
                      ? ChosenEquipDisplay(
                          size: deviceWidth! < 400 ? 90 : 105,
                          color: AppColors.primary,
                          equipType: "Two Handed",
                          weapon: state.displayTwoHandedIcon
                              ? EquipOfChoice(
                                  weaponPic:
                                      state.tempPrimaryWeaponType!.picture,
                                  size: 105,
                                )
                              : const Center(
                                  child: Text(
                                    "?",
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white70),
                                  ),
                                ),
                        )
                      : Row(
                          children: [
                            ChosenEquipDisplay(
                              size: deviceWidth! < 400 ? 55 : 75,
                              color: AppColors.primary,
                              equipType: "Primary\nHand",
                              weapon: state.tempPrimaryWeaponType != null
                                  ? EquipOfChoice(
                                      weaponPic:
                                          state.tempPrimaryWeaponType!.picture)
                                  : const Center(
                                      child: Text(
                                        "?",
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white70),
                                      ),
                                    ),
                            ),
                            if (state.hasChosenPrimaryWeapon)
                              ChosenEquipDisplay(
                                size: deviceWidth! < 400 ? 55 : 75,
                                color: AppColors.primary,
                                equipType: state.char.charEquip
                                                .secondaryWeapon ==
                                            null &&
                                        state.tempOffHandType?.name == "Empty"
                                    ? "Off hand\n Empty"
                                    : "\nOff hand",
                                weapon: state.tempOffHandType != null
                                    ? EquipOfChoice(
                                        weaponPic:
                                            state.tempOffHandType!.picture)
                                    : const Center(
                                        child: Text(
                                          "?",
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white70),
                                        ),
                                      ),
                              ),
                          ],
                        ),
              if (state.hasChosenSecondaryWeapon)
                ChosenEquipDisplay(
                  size: deviceWidth! < 400 ? 55 : 75,
                  color: AppColors.primary,
                  equipType: state.chosenArmorType != null
                      ? "${state.chosenArmorType!.name}\nArmor"
                      : "\nArmor",
                  weapon: state.tempArmorType != null
                      ? EquipOfChoice(weaponPic: state.tempArmorType!.picture)
                      : const Center(
                          child: Text(
                            "?",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                color: Colors.white70),
                          ),
                        ),
                ),
            ],
          ),
          SizedBox(height: deviceHeight! * 0.02),
          if (state.chosenSecondaryWeaponType == null)
            Column(
              children: [
                if (!state.cantChooseTwoHandedAnymore)
                  EquipDisplayChoiceRow(
                    label: "One-handed",
                    itemCounting: state.listOfEquip.oneHandedTypes.length,
                    weaponList: state.listOfEquip.oneHandedTypes,
                    onLongPress: () => state.updatePrimaryweaponType(),
                  ),
                if (!state.cantChooseTwoHandedAnymore)
                  EquipDisplayChoiceRow(
                    label: "Two-handed",
                    itemCounting: state.listOfEquip.twoHandedTypes.length,
                    weaponList: state.listOfEquip.twoHandedTypes,
                    onLongPress: () => state.updatePrimaryweaponType(),
                  ),
                if (!state.cantChooseTwoHandedAnymore)
                  EquipDisplayChoiceRow(
                    label: "Range",
                    itemCounting: state.listOfEquip.distanceTypes.length,
                    weaponList: state.listOfEquip.distanceTypes,
                    onLongPress: () => state.updatePrimaryweaponType(),
                  ),
              ],
            ),
          if (state.readyToChoseShield && !state.hasChosenSecondaryWeapon)
            Column(
              children: [
                OffHandDisplayRow(
                  label: "Off-Hand Equip",
                  itemCounting: state.filteredOffHandTypes.length,
                  offHandList: state.filteredOffHandTypes,
                  onLongPress: () => state.updateOffHandType(),
                ),
              ],
            ),
          if (state.hasChosenSecondaryWeapon && state.chosenArmorType == null)
            EquipDisplayChoiceRow(
              label: "Armor",
              itemCounting: state.filteredArmorTypes.length,
              onLongPress: () => state.updateArmorType(),
              armorList: state.filteredArmorTypes,
            ),
          SizedBox(height: deviceHeight! * 0.02),
          if (state.chosenPrimaryWeaponType != null)
            AppAnimatedButton(
              onTap: () => state.resetChoices(),
              label: "Reset",
            ),
          SizedBox(height: deviceHeight! * 0.03),
          if (state.equipGenerated)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceWidth! * 0.03),
              child: Column(
                children: [
                  const EquipSectionModal(label: "Primary Weapon"),
                  SizedBox(height: deviceHeight! * 0.01),
                  Row(
                    children: [
                      const SizedBox(width: 6),
                      Text("${state.char.charEquip.primaryWeapon!.name}",
                          style: AppTextStyle.subTextWhite),
                      const SizedBox(width: 15),
                      Text("Damage ", style: AppTextStyle.statsLabel),
                      const SizedBox(width: 6),
                      Text("${state.char.charEquip.primaryWeapon!.damage}",
                          style: AppTextStyle.subTextWhite),
                    ],
                  ),
                  if (state.isDualWield || !state.cantChooseTwoHandedAnymore)
                    Column(
                      children: [
                        SizedBox(height: deviceHeight! * 0.01),
                        const EquipSectionModal(label: "Off-hand Weapon"),
                        SizedBox(height: deviceHeight! * 0.01),
                        Row(
                          children: [
                            const SizedBox(width: 6),
                            Text(
                                "${state.char.charEquip.secondaryWeapon!.name}",
                                style: AppTextStyle.subTextWhite),
                            const SizedBox(width: 15),
                            Text("Damage ", style: AppTextStyle.statsLabel),
                            const SizedBox(width: 6),
                            Text(
                                "${state.char.charEquip.secondaryWeapon!.damage}",
                                style: AppTextStyle.subTextWhite),
                          ],
                        ),
                      ],
                    ),
                  if (state.char.charEquip.shield != null)
                    Column(
                      children: [
                        SizedBox(height: deviceHeight! * 0.02),
                        const EquipSectionModal(label: "Shield"),
                        SizedBox(height: deviceHeight! * 0.01),
                        Row(
                          children: [
                            const SizedBox(width: 6),
                            Text(state.char.charEquip.shield!.name!,
                                style: AppTextStyle.subTextWhite),
                            const SizedBox(width: 3),
                            Text("AC bonus: ", style: AppTextStyle.statsLabel),
                            Text(
                                "(${state.char.charEquip.shield!.defenseBonus!})",
                                style: AppTextStyle.subTextWhite),
                            const SizedBox(width: 10),
                          ],
                        ),
                        SizedBox(height: deviceHeight! * 0.01),
                        Row(
                          children: [
                            const SizedBox(width: 6),
                            Text("Check penalty: ",
                                style: AppTextStyle.statsLabel),
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
                      const SizedBox(width: 6),
                      Text(state.char.charEquip.armour!.name!,
                          style: AppTextStyle.subTextWhite),
                      const SizedBox(width: 6),
                      Text("AC bonus: ", style: AppTextStyle.statsLabel),
                      Text("(${state.char.charEquip.armour!.defenseBonus!})",
                          style: AppTextStyle.subTextWhite),
                    ],
                  ),
                  SizedBox(height: deviceHeight! * 0.01),
                  Row(
                    children: [
                      const SizedBox(width: 6),
                      Text("Max Dex ", style: AppTextStyle.statsLabel),
                      const SizedBox(width: 3),
                      Text("(${state.char.charEquip.armour!.maxDexAllowed!})",
                          style: AppTextStyle.subTextWhite),
                      const SizedBox(width: 16),
                      if (state.penaltyToDexApplied)
                        Row(
                          children: [
                            Text("Dex ", style: AppTextStyle.statsLabel),
                            Text("${state.char.baseAtributes.dexterity!}  ",
                                style: AppTextStyle.subTextWhite),
                            Text(
                              "(${state.char.modAtributes.dexterity!})",
                              style: state.penaltyToDexApplied
                                  ? AppTextStyle.penaltyStyle
                                  : null,
                            ),
                            const SizedBox(width: 6),
                            Text("Penalty applied",
                                style: AppTextStyle.penaltyStyleText),
                          ],
                        ),
                    ],
                  ),
                  SizedBox(height: deviceHeight! * 0.01),
                  Row(
                    children: [
                      const SizedBox(width: 6),
                      Text("Check penalty: ", style: AppTextStyle.statsLabel),
                      const SizedBox(width: 6),
                      Text(
                          state.char.charEquip.armour!.checkPenalty! == 0
                              ? "(0)"
                              : "(-${state.char.charEquip.armour!.checkPenalty!})",
                          style: AppTextStyle.subTextWhite),
                    ],
                  ),
                ],
              ),
            ),
        ],
      );
    });
  }
}
