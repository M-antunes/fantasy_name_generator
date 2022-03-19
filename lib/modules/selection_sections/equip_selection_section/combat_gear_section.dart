import 'package:fantasy_name_generator/shared/widgets/app_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/equip_controller.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';

import '../../../shared/themes/app_colors.dart';
import 'widgets/call_dual_wield_check.dart';
import 'widgets/chosen_equip_display.dart';
import 'widgets/equip_display_row.dart';
import 'widgets/off_hand_display_row.dart';

class CombatGear extends StatelessWidget {
  const CombatGear({Key? key}) : super(key: key);

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
                                equipType: "\nOff Hand",
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
                  equipType: "\nArmor",
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
              // if (state.hasChosenArmor)
              //   ChosenEquipDisplay(
              //     size: deviceWidth! < 400 ? 55 : 75,
              //     color: AppColors.primary,
              //     equipType: "\nShield",
              //     weapon: state.tempShieldType != null
              //         ? EquipOfChoice(weaponPic: state.tempShieldType!.picture)
              //         : const Center(
              //             child: Text(
              //               "?",
              //               style: TextStyle(
              //                   fontSize: 40,
              //                   fontWeight: FontWeight.w700,
              //                   color: Colors.white70),
              //             ),
              //           ),
              //   ),
            ],
          ),
          SizedBox(height: deviceHeight! * 0.02),
          if (state.chosenSecondaryWeaponType == null)
            Column(
              children: [
                if (!state.cantChooseTwoHandedAnymore)
                  EquipDisplayRow(
                    label: "One-handed",
                    itemCounting: state.listOfEquip.oneHandedTypes.length,
                    weaponList: state.listOfEquip.oneHandedTypes,
                    onLongPress: () => state.updatePrimaryweaponType(),
                  ),
                if (!state.cantChooseTwoHandedAnymore)
                  EquipDisplayRow(
                    label: "Two-handed",
                    itemCounting: state.listOfEquip.twoHandedTypes.length,
                    weaponList: state.listOfEquip.twoHandedTypes,
                    onLongPress: () => state.updatePrimaryweaponType(),
                  ),
                if (!state.cantChooseTwoHandedAnymore)
                  EquipDisplayRow(
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
                  onLongPress: () => state.updateOffHandType(
                      () => callDualWieldCheck(context, state)),
                ),
              ],
            ),
          if (state.hasChosenSecondaryWeapon && state.chosenArmorType == null)
            EquipDisplayRow(
              label: "Armor",
              itemCounting: state.filteredArmorTypes.length,
              armorList: state.filteredArmorTypes,
              onLongPress: () => state.updateArmorType(),
            ),
          SizedBox(height: deviceHeight! * 0.02),
          if (state.chosenPrimaryWeaponType != null)
            AppAnimatedButton(
              onTap: () => state.resetChoices(),
              label: "Reset",
            ),
        ],
      );
    });
  }
}
