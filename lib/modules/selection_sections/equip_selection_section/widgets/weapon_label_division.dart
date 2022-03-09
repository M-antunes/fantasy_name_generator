import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../controllers/equip_controller.dart';

class WeaponLabelSection extends StatelessWidget {
  final Size size;
  final EquipController ctrl;
  final String label;
  const WeaponLabelSection({
    Key? key,
    required this.size,
    required this.ctrl,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor:
          ctrl.chosenSecondaryWeaponType != null ? Colors.transparent : null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size.width * 0.93,
            height: 2,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Chip(
            label: Text(label, style: AppTextStyle.weaponCategoryText),
          ),
        ],
      ),
      onTap: () => ctrl.chosenSecondaryWeaponType != null
          ? null
          : ctrl.makeWeaponSegmentTrue(label),
    );
  }
}
