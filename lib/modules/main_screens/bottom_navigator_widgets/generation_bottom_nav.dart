import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/stage_controller/char_controller.dart';
import 'package:fantasy_name_generator/controllers/stats_controller/stats_controller.dart';

import '../../../shared/routes/app_roues.dart';
import '../../../shared/themes/app_colors.dart';
import '../../../shared/widgets/app_animated_button.dart';
import '../../../shared/widgets/app_generate_button.dart';
import '../../../shared/widgets/call_message_snackbar.dart';
import '../../../shared/widgets/call_warning_widget.dart';

// ignore: must_be_immutable
class GenerationBottomNav extends StatelessWidget {
  const GenerationBottomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CharController>(builder: (context, state, child) {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer<StatsController>(builder: (context, ctrl, child) {
              return AppAnimatedButton(
                  label: state.creationStage == 8 ? "Reset" : "Previous",
                  onTap: () {
                    if (state.creationStage == 1) {
                      Navigator.of(context).pop();
                    } else if (state.creationStage == 8) {
                      confimrReset(context, state.cha.charName.fullName,
                          state.chosenClass.name, () {
                        state.startCharAllOver();
                        ctrl.resetEquipAndStats();
                        Navigator.pop(context);
                      });
                    } else {
                      state.retreatCreationStage();
                    }
                  });
            }),
            if (state.creationStage == 2)
              AppGenerateButton(
                onGenerate: () => state.newNameGenerator(),
              ),
            if (state.creationStage == 8)
              Consumer<StatsController>(builder: (context, ctrl, child) {
                return AppGenerateButton(
                  icon: !ctrl.statsGenerated
                      ? null
                      : const Icon(Icons.delete_forever, size: 35),
                  onGenerate: !ctrl.statsGenerated
                      ? () => Navigator.of(context)
                          .pushNamed(AppRoutes.loading)
                          .then((value) => ctrl.generateAll())
                      : () => ctrl.resetEquipAndStats(),
                );
              }),
            AppAnimatedButton(
              label: state.creationStage == 8 ? "Save" : null,
              onTap: state.creationStage == 8
                  ? () {}
                  : () => buttonFunction(state, context),
            ),
          ],
        ),
      );
    });
  }
}

void buttonFunction(CharController state, BuildContext context) {
  var text = state.activateNextButton();
  if (text != null) {
    callMessageSnackbar(context, text, AppColors.warningColor, null);
  }
}

confimrReset(BuildContext context, String charName, String className,
    VoidCallback onTap) {
  callStartOverConfirmation(context, className, charName, onTap);
}
