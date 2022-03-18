import 'package:flutter/material.dart';

import '../../../../controllers/equip_controller.dart';
import '../../../../shared/themes/app_text_styles.dart';

Future<dynamic> callDualWieldCheck(
    BuildContext context, EquipController state) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            "Both primary and secondary weapons are one-handed.\nIs ${state.char.charName.fullName} supposed to dual wield?",
            style: AppTextStyle.subTextGreyPlusSize,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
                child: Text("Yes", style: AppTextStyle.warningButtonConfirm),
                onPressed: () {
                  state.confirmDualWield();
                  Navigator.of(context).pop();
                }),
            TextButton(
                child: Text("No", style: AppTextStyle.warningButtonDeny),
                onPressed: () => Navigator.of(context).pop()),
          ],
        );
      });
}
