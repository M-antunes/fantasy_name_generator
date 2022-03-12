import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/equip_controller.dart';
import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:fantasy_name_generator/shared/widgets/expanded_section.dart';

import 'widgets/row_of_weapon_types.dart';
import 'widgets/weapon_label_division.dart';

class WeaponChoiceSection extends StatelessWidget {
  final CharModel char;
  const WeaponChoiceSection({
    Key? key,
    required this.char,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<EquipController>(
      builder: (context, state, child) {
        state.populateAllLists();
        return Column(
          children: [
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: AppTextStyle.subTextGreyPlusSize,
                  children: [
                    const TextSpan(
                      text: "Select ",
                    ),
                    TextSpan(
                      text: "${char.charName.fullName}'s",
                      style: AppTextStyle.subTextWhitePlusSize,
                    ),
                    TextSpan(
                      text: state.chosenPrimaryWeaponType == null &&
                              state.chosenSecondaryWeaponType == null &&
                              state.chosenEmergencyWeaponType == null
                          ? " Primary weapon type"
                          : state.chosenPrimaryWeaponType != null &&
                                  state.chosenSecondaryWeaponType == null &&
                                  state.chosenEmergencyWeaponType == null
                              ? " Secondary weapon type"
                              : state.chosenPrimaryWeaponType != null &&
                                      state.chosenSecondaryWeaponType != null &&
                                      state.chosenEmergencyWeaponType != null
                                  ? " Finished"
                                  : " Emergency weapon type",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChosenWeaponDisplay(
                  size: deviceWidth! < 400 ? 75 : 90,
                  state: state,
                  color: AppColors.primary,
                  weaponRank: "Primary\nWeapon",
                  weapon: state.chosenPrimaryWeaponType != null
                      ? WeaponOfChoice(
                          weaponPic: state.chosenPrimaryWeaponType!.picture)
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
                ChosenWeaponDisplay(
                  size: deviceWidth! < 400 ? 65 : 80,
                  state: state,
                  color: Colors.white70,
                  weaponRank: "Secondary\nWeapon",
                  weapon: state.chosenSecondaryWeaponType != null
                      ? WeaponOfChoice(
                          weaponPic: state.chosenSecondaryWeaponType!.picture)
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
                ChosenWeaponDisplay(
                  size: deviceWidth! < 400 ? 55 : 70,
                  state: state,
                  color: Colors.white70,
                  weaponRank: "Emergency\nWeapon",
                  weapon: state.chosenEmergencyWeaponType != null
                      ? WeaponOfChoice(
                          weaponPic: state.chosenEmergencyWeaponType!.picture)
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
            SizedBox(height: size.height * 0.015),
            WeaponLabelSection(size: size, ctrl: state, label: "One-handed"),
            ExpandedSection(
              expand: state.showOneHanded,
              child: RowOfWeaponType(
                size: size,
                ctrl: state,
                weaponTypeList: state.listOfEquip.oneHandedTypes,
                isTypeDescriptionSelected: state.showOneHanded,
              ),
            ),
            WeaponLabelSection(size: size, ctrl: state, label: "Two-handed"),
            ExpandedSection(
              expand: state.showTwoHanded,
              child: RowOfWeaponType(
                size: size,
                ctrl: state,
                weaponTypeList: state.listOfEquip.twoHandedTypes,
                isTypeDescriptionSelected: state.showTwoHanded,
              ),
            ),
            Column(
              children: [
                WeaponLabelSection(size: size, ctrl: state, label: "Distant"),
                ExpandedSection(
                  expand: state.showDistant,
                  child: RowOfWeaponType(
                    size: size,
                    ctrl: state,
                    weaponTypeList: state.listOfEquip.distanceTypes,
                    isTypeDescriptionSelected: state.showDistant,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.04),
            state.chosenEmergencyWeaponType != null
                ? Text(
                    "Click next to continue\nor reset to change choices",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.subTextGrey,
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }
}

class ChosenWeaponDisplay extends StatelessWidget {
  final EquipController state;
  final String weaponRank;
  final Color color;
  final Widget weapon;
  final double size;
  const ChosenWeaponDisplay({
    Key? key,
    required this.state,
    required this.weaponRank,
    required this.color,
    required this.weapon,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weaponRank,
          style: AppTextStyle.weaponSelectedText,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(30),
          ),
          // width: deviceWidth! < 400 ? 55 : 70,
          // height: deviceWidth! < 400 ? 55 : 70,
          width: size,
          height: size,
          child: weapon,
        ),
      ],
    );
  }
}

class WeaponOfChoice extends StatelessWidget {
  final String weaponPic;

  const WeaponOfChoice({
    Key? key,
    required this.weaponPic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      weaponPic,
      color: AppColors.primary,
    );
  }
}
