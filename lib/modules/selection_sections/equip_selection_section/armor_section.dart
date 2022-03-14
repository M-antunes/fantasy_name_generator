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
          "Choose armor type:",
          style: AppTextStyle.subTextGreyPlusSize,
        ),
        SizedBox(height: deviceHeight! * 0.05),
        Consumer<EquipController>(builder: (context, state, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 8 / 6,
                  crossAxisCount: 2,
                ),
                itemCount: state.listOfEquip.armorTypes.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var armor = state.listOfEquip.armorTypes[index];
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
