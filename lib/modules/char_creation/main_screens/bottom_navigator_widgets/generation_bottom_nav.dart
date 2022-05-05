import 'package:fantasy_name_generator/controllers/char_admin_controller/char_adimin_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/stage_controller/char_controller.dart';
import 'package:fantasy_name_generator/controllers/stats_controller/stats_controller.dart';

import '../../../../shared/routes/app_roues.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/widgets/app_animated_button.dart';
import '../../../../shared/widgets/app_generate_button.dart';
import '../../../../shared/widgets/call_message_snackbar.dart';
import '../widgets/call_confirm_save._widget.dart';
import '../widgets/call_statr_over_widget.dart';

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
                  label: state.creationStage == 8 ? "Reset all" : "Previous",
                  onTap: () {
                    if (state.creationStage == 1) {
                      Navigator.of(context).pop();
                    } else if (state.creationStage == 8) {
                      callStartOverConfirmation(context, state.chosenClass.name,
                          state.cha.charName.fullName, () {
                        state.startCharAllOver();
                        ctrl.resetEquipAndStats();
                        Navigator.pop(context);
                      });
                    } else if (state.creationStage == 7 && state.isMinion) {
                      state.retreatCreationStage();
                      state.retreatCreationStage();
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
            if (state.creationStage != 8)
              AppAnimatedButton(
                onTap: () => buttonFunction(state, context),
              ),
            if (state.creationStage == 8)
              Consumer<StatsController>(builder: (context, ctrl, child) {
                var admin = context.read<CharAdminController>();
                return ctrl.statsGenerated
                    ? AppAnimatedButton(
                        label: "Save",
                        onTap: () {
                          confirmSave(context, ctrl.char.charName.fullName,
                              ctrl.char.charClass.name, () {
                            ctrl.updateCharModel();
                            admin.saveCharInHive(ctrl.char);
                            state.startCharAllOver();
                            ctrl.resetEquipAndStats();
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            callMessageSnackbar(context, "Character Saved",
                                AppColors.successColor, 1800);
                          });
                        })
                    : const SizedBox();
              }),
          ],
        ),
      );
    });
  }

  void buttonFunction(CharController state, BuildContext context) {
    var text = state.activateNextButton();
    if (text != null) {
      callMessageSnackbar(context, text, AppColors.warningColor, null);
    }
  }
}
