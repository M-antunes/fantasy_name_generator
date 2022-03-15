import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/equip_controller.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:fantasy_name_generator/shared/widgets/atribute_division.dart';

class TestEquipProgressCheck extends StatelessWidget {
  final EquipController ctrl;
  const TestEquipProgressCheck({
    Key? key,
    required this.ctrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: deviceHeight! * 0.03),
        const AtributeDivision(label: "Combat equipment"),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: deviceWidth! * 0.03),
          child: Consumer<EquipController>(
            builder: ((context, state, child) {
              return Column(
                children: [
                  EquipDescriptionTile(
                    weaponChoice: "Primary Weapon",
                    weaponName: "Example",
                    critical: "x3",
                    damage: "2d6",
                    picture: state.chosenPrimaryWeaponType!.picture,
                  ),
                  EquipDescriptionTile(
                    weaponChoice: "Seconday Weapon",
                    weaponName: "Example",
                    critical: "x3",
                    damage: "2d6",
                    picture: state.chosenSecondaryWeaponType!.picture,
                  ),
                  EquipDescriptionTile(
                    weaponChoice: "Emergency Weapon",
                    weaponName: "Example",
                    critical: "x3",
                    damage: "2d6",
                    picture: state.chosenEmergencyWeaponType!.picture,
                  ),
                  EquipDescriptionTile(
                    weaponChoice: "Shield",
                    weaponName: "Example",
                    critical: "x3",
                    damage: "2d6",
                    picture: state.chosenShieldType!.picture,
                  ),
                  EquipDescriptionTile(
                    weaponChoice: "Armor",
                    weaponName: "Example",
                    critical: "x3",
                    damage: "2d6",
                    picture: state.chosenArmorType!.picture,
                  ),
                ],
              );
            }),
          ),
        )
      ],
    );
  }
}

class EquipDescriptionTile extends StatelessWidget {
  final String picture;
  final String weaponChoice;
  final String weaponName;
  final String damage;
  final String critical;
  const EquipDescriptionTile({
    Key? key,
    required this.picture,
    required this.weaponChoice,
    required this.weaponName,
    required this.damage,
    required this.critical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
            margin: EdgeInsets.zero,
            elevation: 4,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                width: 190,
                margin: EdgeInsets.zero,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      child: Text(
                        weaponChoice,
                        style: AppTextStyle.subTextWhite,
                      ),
                    ))),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          margin: EdgeInsets.zero,
          child: ListTile(
            leading: SvgPicture.asset(
              picture,
              height: 35,
              color: Colors.white70,
            ),
            title: Text(
              weaponName,
              style: AppTextStyle.subTextGreyPlusSize,
            ),
            subtitle: Text(
              damage,
              style: AppTextStyle.weaponNotSelected,
            ),
            trailing: Text(critical, style: AppTextStyle.subTextGreyPlusSize),
          ),
        ),
        SizedBox(
          height: deviceHeight! * 0.02,
        )
      ],
    );
  }
}
