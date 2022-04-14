import 'package:fantasy_name_generator/controllers/stats_controller/stats_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/stage_controller/char_controller.dart';
import 'package:fantasy_name_generator/modules/main_screens/widgets/progression_bar.dart';
import 'package:fantasy_name_generator/modules/main_screens/widgets/char_selection_label.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:fantasy_name_generator/shared/widgets/app_animated_button.dart';
import 'package:fantasy_name_generator/shared/widgets/call_message_snackbar.dart';

import '../../shared/widgets/app_generate_button.dart';
import '../selection_sections/alignment/alignment_section.dart';
import '../selection_sections/class_section/class_section.dart';
import '../selection_sections/combat_style_equip/combat_style_section.dart';
import '../selection_sections/name_and_gender/gender_section.dart';
import '../selection_sections/level/level_section.dart';
import '../selection_sections/name_and_gender/name_section.dart';
import '../selection_sections/physical_combat/physical_combat_section.dart';
import '../selection_sections/race/race_section.dart';
import '../selection_sections/stats_sections/stats_main/stats_section.dart';
import 'widgets/character_info_bar.dart';

class CharDevelopmentPage extends StatefulWidget {
  const CharDevelopmentPage({Key? key}) : super(key: key);

  @override
  _CharDevelopmentPageState createState() => _CharDevelopmentPageState();
}

class _CharDevelopmentPageState extends State<CharDevelopmentPage>
    with TickerProviderStateMixin {
  late final CharController namesController;

  @override
  void initState() {
    namesController = context.read<CharController>();
    namesController.starttempRace();
    namesController.getInitialCombatStyle();
    namesController.startTempClass();
    // namesController.startTempAlignment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Consumer<CharController>(builder: (context, state, child) {
          return ListView(
            children: [
              const SizedBox(height: 5),
              CharSelectionLabel(
                  size: size,
                  label: state.creationStage == 1
                      ? "Race"
                      : state.creationStage == 2
                          ? "Gender & Name"
                          : state.creationStage == 3
                              ? "${state.newName} ${state.newLastName} - Combat Style"
                              : state.creationStage == 4
                                  ? "${state.newName} ${state.newLastName} - Class"
                                  : state.creationStage == 5
                                      ? "${state.newName} ${state.newLastName} - Combat Equip"
                                      : state.creationStage == 6
                                          ? "${state.newName} ${state.newLastName} - Aligment"
                                          : state.creationStage == 7
                                              ? "${state.newName} ${state.newLastName} - Level"
                                              : "Stats generator"),
              ProgressionBar(
                controller: state,
              ),
              if (state.creationStage != 8)
                CharacterInfoBar(
                    race: state.creationStage > 1 ? state.chosenRace.name : "",
                    gender: state.creationStage == 1 || state.creationStage == 2
                        ? ""
                        : state.isMale
                            ? "Male"
                            : "Female",
                    className:
                        state.creationStage > 4 ? state.chosenClass.name : ""),
              SizedBox(height: size.height * 0.01),
              if (state.creationStage == 1) const RaceSelection(),
              if (state.creationStage == 2)
                Column(
                  children: [
                    const GenderSelection(),
                    SizedBox(height: size.height * 0.07),
                    NameSelection(
                      onGenerate: () => state.newNameGenerator(),
                      onSelect: state.newName == " - ? - "
                          ? () => callMessageSnackbar(
                              context,
                              "You must generate a name first",
                              AppColors.warningColor,
                              null)
                          : () => state.advanceCreationStage(),
                    ),
                  ],
                ),
              if (state.creationStage == 3) const CombatStyleSection(),
              if (state.creationStage == 4) const ClassSelection(),
              if (state.creationStage == 5) const CombatEquipSection(),
              if (state.creationStage == 6) const AlignmentSelection(),
              if (state.creationStage == 7) const LevelSelection(),
              if (state.creationStage == 8) const StatsSection(),
            ],
          );
        }),
      ),
      bottomNavigationBar:
          Consumer<CharController>(builder: (context, state, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppAnimatedButton(
                  label: "Previous",
                  onTap: () {
                    if (state.creationStage == 1) {
                      Navigator.of(context).pop();
                    } else if (state.creationStage == 8) {
                      state.resetLevel();
                      state.retreatCreationStage();
                    } else {
                      state.retreatCreationStage();
                    }
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
                        ? () {
                            ctrl.generateAll();
                            ctrl.updateStats();
                          }
                        : () {
                            ctrl.char = state.cha;
                            ctrl.resetEquipAndStats();
                            ctrl.updateStats();
                          },
                  );
                }),
              AppAnimatedButton(
                onTap: () => buttonFunction(state, context),
              ),
            ],
          ),
        );
      }),
    );
  }

  void buttonFunction(CharController state, BuildContext context) {
    var text = state.activateNextButton();
    if (text != null) {
      callMessageSnackbar(context, text, AppColors.warningColor, null);
    }
  }
}
