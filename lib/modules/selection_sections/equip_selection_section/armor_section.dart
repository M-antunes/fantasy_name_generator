import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/controllers/equip_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ArmorSection extends StatelessWidget {
  final EquipController ctrl;
  const ArmorSection({
    Key? key,
    required this.ctrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: deviceHeight! * 0.2),
        Text(
          ctrl.char.charClass.name == "Alchemist" ||
                  ctrl.char.charClass.name == "Summoner" ||
                  ctrl.char.charClass.name == "Barbarian" ||
                  ctrl.char.charClass.name == "Ranger"
              ? "${ctrl.char.charClass.name}s are NOT proficient with heavy armors"
              : ctrl.char.charClass.name == "Bard" ||
                      ctrl.char.charClass.name == "Rogue"
                  ? "${ctrl.char.charClass.name}s are NOT proficient with medium or heavy armors"
                  : ctrl.char.charClass.name == "Wizard" ||
                          ctrl.char.charClass.name == "Sorcerer" ||
                          ctrl.char.charClass.name == "Monk"
                      ? "${ctrl.char.charClass.name}s are NOT proficient with ANY armors"
                      : ctrl.char.charClass.name == "Druid"
                          ? "${ctrl.char.charClass.name}s are NOT proficient with heavy armors or any made out of metal"
                          : "${ctrl.char.charClass.name}s are proficient with all armors",
          style: AppTextStyle.subTextGreyPlusSize,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: deviceHeight! * 0.003),
        Container(
          width: deviceWidth! * 0.92,
          height: deviceHeight! * 0.003,
          color: Colors.grey,
        ),
        SizedBox(height: deviceHeight! * 0.05),
        Consumer<EquipController>(builder: (context, state, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 8 / 6,
                  crossAxisCount: state.filteredArmors.length > 1 ? 2 : 1,
                ),
                itemCount: state.filteredArmors.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var armor = state.filteredArmors[index];
                  return InkWell(
                    splashColor: Colors.transparent,
                    child: Column(
                      children: [
                        SizedBox(
                            height: armor.isSelected ? 90 : 80,
                            width: armor.isSelected ? 90 : 80,
                            child: SvgPicture.asset(armor.picture,
                                color: armor.isSelected
                                    ? AppColors.primary
                                    : Colors.white70)),
                        Text(
                          armor.name,
                          style: armor.isSelected
                              ? AppTextStyle.weaponSelected
                              : AppTextStyle.weaponNotSelected,
                        )
                      ],
                    ),
                    onTap: () => state.switchArmorType(armor),
                  );
                }),
          );
        }),
      ],
    );
  }
}
