import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/controllers/equip_controller.dart';

import '../../../../shared/themes/app_text_styles.dart';

Future<dynamic> callShieldDesireConfirmation(
    BuildContext context, EquipController state) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: WillCharHaveShieldOrNot(
            ctrl: state,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  state.advanceCreationStage();
                  state.advanceCreationStage();
                  Navigator.of(context).pop();
                },
                child: Text("Yes", style: AppTextStyle.warningButtonConfirm)),
            TextButton(
                onPressed: () {
                  state.advanceCreationStage();
                  Navigator.of(context).pop();
                },
                child: Text("No", style: AppTextStyle.warningButtonDeny)),
          ],
        );
      });
}

class WillCharHaveShieldOrNot extends StatelessWidget {
  final EquipController ctrl;

  const WillCharHaveShieldOrNot({
    Key? key,
    required this.ctrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      strutStyle: const StrutStyle(fontSize: 21),
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppTextStyle.subTextGreyPlusSize,
        children: [
          const TextSpan(
            text: "The main fighting style chosen for ",
          ),
          TextSpan(
              text: ctrl.char.charName.fullName,
              style: AppTextStyle.subTextWhitePlusSize),
          const TextSpan(
              text:
                  " doesn't requier any shield.\nDo you wish to skip the section for choosing a shield?")
        ],
      ),
    );
  }
}
