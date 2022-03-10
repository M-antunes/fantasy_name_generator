import 'dart:async';

import 'package:fantasy_name_generator/controllers/equip_controller.dart';
import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/modules/main_screens/widgets/progression_bar.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:fantasy_name_generator/shared/widgets/app_animated_button.dart';
import 'package:fantasy_name_generator/shared/widgets/call_message_snackbar.dart';

import '../../shared/themes/app_text_styles.dart';
import '../selection_sections/equip_selection_section/physical_combat_focus.dart';
import '../selection_sections/equip_selection_section/weapon_choice_section.dart';
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
                    ? "Equipment - Physical Combat"
                    : state.creationStage == 2
                        ? "Equipment - Weapons"
                        : state.creationStage == 3
                            ? "Equipment - Shield"
                            : state.creationStage == 4
                                ? "Equipment - Armor"
                                : state.creationStage == 5
                                    ? "Equipment - Level"
                                    : state.creationStage == 6
                                        ? "Equipment - Stats"
                                        : state.creationStage == 7
                                            ? "Equipment - Basic features ready"
                                            : ''),
            EquipProgressionBar(
              controller: state,
            ),
            Center(
              child: Text(" (${char.charClass.name})",
                  style: AppTextStyle.subTextGreyPlusSize),
            ),
            if (state.creationStage == 1)
              PhysicalCombatFocus(char: char, ctrl: state),
            if (state.creationStage == 2) WeaponChoiceSection(char: char),
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
                      Timer(const Duration(milliseconds: 1300),
                          (() => state.updateShowResetButton()));
                    }),
              if (state.creationStage == 2 &&
                  state.chosenSecondaryWeaponType != null &&
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

  void buttonFunction(EquipController state, BuildContext context) {
    var text = state.activateNextButton();
    if (text != null) {
      callMessageSnackbar(context, text, AppColors.warningColor);
    }
  }
}
