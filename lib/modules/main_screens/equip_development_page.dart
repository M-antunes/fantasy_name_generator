import 'dart:async';

import 'package:fantasy_name_generator/controllers/equip_controller.dart';
import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/modules/selection_sections/equip_selection_section/equip_progress_check.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/modules/main_screens/widgets/progression_bar.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:fantasy_name_generator/shared/widgets/app_animated_button.dart';
import 'package:fantasy_name_generator/shared/widgets/call_message_snackbar.dart';

import '../../shared/themes/app_text_styles.dart';
import '../../shared/widgets/call_warning_widget.dart';
import '../selection_sections/equip_selection_section/armor_section.dart';
import '../selection_sections/equip_selection_section/choice_section.dart';
import '../selection_sections/equip_selection_section/shield_section.dart';
import '../selection_sections/equip_selection_section/widgets/will_char_have_shield_or_not.dart';
import '../selection_sections/equip_selection_section/weapon_section.dart';
import 'widgets/call_dual_weild_check_dialog.dart';
import 'widgets/equip_selection_label.dart';

class EquipDevelopMentPage extends StatefulWidget {
  const EquipDevelopMentPage({Key? key}) : super(key: key);

  @override
  _EquipDevelopMentPageState createState() => _EquipDevelopMentPageState();
}

class _EquipDevelopMentPageState extends State<EquipDevelopMentPage> {
  late final EquipController equipController;

  @override
  void initState() {
    equipController = context.read<EquipController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CharModel char = ModalRoute.of(context)!.settings.arguments as CharModel;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<EquipController>(builder: (context, state, child) {
        state.char = char;
        return ListView(
          children: [
            EquipSelectionLabel(
                char: char,
                size: size,
                label: state.creationStage == 1
                    ? "Equipment - Auto generate"
                    : state.creationStage == 2
                        ? "Equipment - Weapons"
                        : state.creationStage == 3
                            ? "Equipment - Shield"
                            : state.creationStage == 4
                                ? "Equipment - Armor"
                                : state.creationStage == 5
                                    ? "Equipment - Progress Check"
                                    : state.creationStage == 6
                                        ? "Equipment - Stats"
                                        : state.creationStage == 7
                                            ? "Equipment - Basic features ready"
                                            : ''),
            EquipProgressionBar(
              controller: state,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(" (${char.charRace.name})",
                      style: AppTextStyle.subTextGreyPlusSize),
                  Text(" (${char.charName.fullName})",
                      style: AppTextStyle.subTextGreyPlusSize),
                  Text(" (${char.charClass.name})",
                      style: AppTextStyle.subTextGreyPlusSize),
                ],
              ),
            ),
            if (state.creationStage == 1) const ChoiceSection(),
            if (state.creationStage == 2) WeaponChoiceSection(char: char),
            if (state.creationStage == 3) ShieldSection(ctrl: state),
            if (state.creationStage == 4) ArmorSection(ctrl: state),
            if (state.creationStage == 5) EquipProgressCheck(ctrl: state),
          ],
        );
      }),
      bottomNavigationBar:
          Consumer<EquipController>(builder: (context, state, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state.creationStage == 2 &&
                  state.tempPrimaryWeaponTypeForSwitching != null &&
                  state.chosenPrimaryWeaponType == null)
                AppAnimatedButton(
                    label: "Confirm",
                    onTap: () {
                      state.updatePrimaryweaponType();
                    }),
              if (state.creationStage == 2 &&
                  state.tempSecondaryWeaponTypeForSwitching != null &&
                  state.chosenSecondaryWeaponType == null)
                AppAnimatedButton(
                    label: "Confirm",
                    onTap: () {
                      state.updateSecondaryweaponType();
                      dualWeildCheck(
                        state,
                        context,
                        char,
                      );
                      state.informImportanceOfVersatileCombat(
                        () => callNoDistantCombatWeaponWarning(context, state),
                        () => callNoColseCombatWeaponWarning(context, state),
                      );
                    }),
              if (state.creationStage == 2 &&
                  state.tempEmergencyWeaponTypeForSwitching != null &&
                  state.chosenEmergencyWeaponType == null)
                AppAnimatedButton(
                    label: "Confirm",
                    onTap: () {
                      state.updateEmergencyweaponType();
                      Timer(const Duration(milliseconds: 800),
                          (() => state.updateShowResetButton()));
                    }),
              if (state.creationStage == 2 &&
                  state.chosenEmergencyWeaponType != null &&
                  state.showResetButton)
                AppAnimatedButton(
                    label: "Reset", onTap: () => state.resetChoices()),
              SizedBox(height: size.height * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppAnimatedButton(
                      label: "Previous",
                      onTap: () {
                        if (state.creationStage == 1) {
                          Navigator.of(context).pop();
                        } else if (state.creationStage == 3) {
                          state.undoNoshield();
                          state.retreatCreationStage();
                        } else if (state.creationStage == 4 &&
                                state.hasDualWeild ||
                            state.listOfEquip.twoHandedTypes
                                .contains(state.chosenPrimaryWeaponType) ||
                            state.listOfEquip.distanceTypes
                                .contains(state.chosenPrimaryWeaponType)) {
                          state.retreatCreationStage();
                          state.retreatCreationStage();
                        } else {
                          state.retreatCreationStage();
                        }
                      }),
                  AppAnimatedButton(
                      onTap: () => buttonFunction(state, context)),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  dualWeildCheck(EquipController state, BuildContext context, CharModel char) {
    state.showDualWeildIntentionCheck(() => callDualWeildCheck(
          context,
          "${state.chosenPrimaryWeaponType!.name} & ${state.chosenSecondaryWeaponType!.name}.\nIs ${char.charName.fullName} supposed to Dual Weild?",
          () => state.confirmDualWeild(() {
            Navigator.of(context).pop();
            callNoDistantCombatWeaponWarning(context, state);
          }),
          () {
            Navigator.of(context).pop();
            callNoDistantCombatWeaponWarning(context, state);
          },
        ));
  }

  Future<dynamic> callNoDistantCombatWeaponWarning(
      BuildContext context, EquipController state) {
    return callWarningWidget(
      context,
      "You have chosen two close combat weapons for ${state.char.charName.fullName}.\nIt is recomended that at least ${state.char.charName.possessiveAdjective} emergency weapon is fit for distant combat.",
    );
  }

  Future<dynamic> callNoColseCombatWeaponWarning(
      BuildContext context, EquipController state) {
    return callWarningWidget(
      context,
      "You have chosen two distant combat weapons for ${state.char.charName.fullName}.\nIt is recomended that at least ${state.char.charName.possessiveAdjective} emergency weapon is fit for close combat.",
    );
  }

  void buttonFunction(EquipController state, BuildContext context) {
    if (state.creationStage == 2) {
      if (state.hasDualWeild ||
          state.listOfEquip.twoHandedTypes
              .contains(state.chosenPrimaryWeaponType) ||
          state.listOfEquip.distanceTypes
              .contains(state.chosenPrimaryWeaponType)) {
        state.retreatCreationStage();
        callShieldDesireConfirmation(context, state);
      }
    }
    var text = state.activateNextButton();
    if (text != null) {
      callMessageSnackbar(context, text, AppColors.warningColor, null);
    }
  }
}
