import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
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
        Text(
          "Choose shield type:",
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
                itemCount: state.listOfEquip.shieldTypes.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var shield = state.listOfEquip.shieldTypes[index];
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
