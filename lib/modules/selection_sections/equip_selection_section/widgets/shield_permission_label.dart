import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/equip_controller.dart';
import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/themes/app_text_styles.dart';

class ShieldPermissionLabel extends StatelessWidget {
  const ShieldPermissionLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<EquipController>(builder: (context, ctrl, child) {
          return Text(
            ctrl.char.charClass.name == "Wizard" ||
                    ctrl.char.charClass.name == "Sorcerer" ||
                    ctrl.char.charClass.name == "Commoner" ||
                    ctrl.char.charClass.name == "Noble" ||
                    ctrl.char.charClass.name == "Aristocrat" ||
                    ctrl.char.charClass.name == "Rogue" ||
                    ctrl.char.charClass.name == "Alchemist" ||
                    ctrl.char.charClass.name == "Summoner" ||
                    ctrl.char.charClass.name == "Monk"
                ? "${ctrl.char.charClass.name}s are NOT proficient with ANY shields"
                : ctrl.char.charClass.name == "Druid"
                    ? "${ctrl.char.charClass.name}s are NOT proficient with metal shields"
                    : "${ctrl.char.charClass.name}s are proficient with all shields",
            style: AppTextStyle.subTextGrey,
            textAlign: TextAlign.center,
          );
        }),
        SizedBox(height: deviceHeight! * 0.01),
      ],
    );
  }
}
