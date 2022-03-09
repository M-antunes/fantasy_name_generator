import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/equip_controller.dart';
import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
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
            SizedBox(height: size.height * 0.02),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: AppTextStyle.subTextGreyPlusSize,
                children: [
                  TextSpan(text: "Select ${char.charName.fullName}'s"),
                  TextSpan(
                    text: state.chosenPrimaryWeaponType != null
                        ? " Secondary weapon type"
                        : " Primary weapon type",
                  ),
                  TextSpan(text: "  (${char.charClass.name})"),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChosenWeaponDisplay(
                  state: state,
                  color: AppColors.primary,
                  weaponRank: "Primary Weapon\nSelected",
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
                  state: state,
                  color: Colors.white70,
                  weaponRank: "Secondary Weapon\nSelected",
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
              ],
            ),
            SizedBox(height: size.height * 0.03),
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
            SizedBox(height: size.height * 0.03),
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
  const ChosenWeaponDisplay({
    Key? key,
    required this.state,
    required this.weaponRank,
    required this.color,
    required this.weapon,
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
        SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(30),
          ),
          width: 70,
          height: 70,
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
