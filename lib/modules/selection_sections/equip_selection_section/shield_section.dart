import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:fantasy_name_generator/shared/widgets/app_horizontal_line.dart';
import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/controllers/equip_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ShieldSection extends StatelessWidget {
  final EquipController ctrl;
  const ShieldSection({
    Key? key,
    required this.ctrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: deviceHeight! * 0.2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            ctrl.char.charClass.name == "Rogue" ||
                    ctrl.char.charClass.name == "Sorcerer" ||
                    ctrl.char.charClass.name == "Wizard" ||
                    ctrl.char.charClass.name == "Summoner" ||
                    ctrl.char.charClass.name == "Alchemist" ||
                    ctrl.char.charClass.name == "Monk"
                ? "${ctrl.char.charClass.name}s are NOT proficient with shields"
                : "${ctrl.char.charClass.name}s are proficient with all shields",
            style: AppTextStyle.subTextGrey,
          ),
        ),
        SizedBox(height: deviceHeight! * 0.003),
        const AppHorizontalLine(),
        SizedBox(height: deviceHeight! * 0.05),
        Consumer<EquipController>(builder: (context, state, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 8 / 6,
                  crossAxisCount: state.filteredShields.length > 1 ? 2 : 1,
                ),
                itemCount: state.filteredShields.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var shield = state.filteredShields[index];
                  return InkWell(
                    splashColor: Colors.transparent,
                    child: Column(
                      children: [
                        SizedBox(
                            height: shield.isSelected ? 90 : 80,
                            width: shield.isSelected ? 90 : 80,
                            child: SvgPicture.asset(shield.picture,
                                color: shield.isSelected
                                    ? AppColors.primary
                                    : Colors.white70)),
                        Text(
                          shield.name,
                          style: shield.isSelected
                              ? AppTextStyle.weaponSelected
                              : AppTextStyle.weaponNotSelected,
                        )
                      ],
                    ),
                    onTap: () => state.switchShieldType(shield),
                  );
                }),
          );
        }),
      ],
    );
  }
}
