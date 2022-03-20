import 'package:fantasy_name_generator/controllers/equip_controller.dart';
import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/modules/selection_sections/equip_selection_section/combat_gear_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/modules/main_screens/widgets/progression_bar.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:fantasy_name_generator/shared/widgets/app_animated_button.dart';
import 'package:fantasy_name_generator/shared/widgets/call_message_snackbar.dart';

import '../../shared/themes/app_text_styles.dart';
import '../selection_sections/equip_selection_section/choice_section.dart';
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
                        ? "Equipment - Combat Gear"
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
            if (state.creationStage == 2) const CombatGear(),
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
    if (state.creationStage == 2) {}
    var text = state.activateNextButton();
    if (text != null) {
      callMessageSnackbar(context, text, AppColors.warningColor, null);
    }
  }
}
