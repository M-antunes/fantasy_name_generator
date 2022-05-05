import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/stage_controller/char_controller.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:fantasy_name_generator/shared/widgets/call_message_snackbar.dart';

import '../selection_sections/alignment/alignment_section.dart';
import '../selection_sections/class_section/class_section.dart';
import '../selection_sections/combat_style_equip/combat_style_section.dart';
import '../selection_sections/name_and_gender/gender_section.dart';
import '../selection_sections/level/level_section.dart';
import '../selection_sections/name_and_gender/name_section.dart';
import '../selection_sections/physical_combat/physical_combat_section.dart';
import '../selection_sections/race/race_section.dart';
import '../selection_sections/stats_sections/stats_main/stats_section.dart';
import 'bottom_navigator_widgets/generation_bottom_nav.dart';
import 'widgets/char_selection_label.dart';
import 'widgets/character_info_bar.dart';
import 'widgets/progression_bar.dart';

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
                        ? "Character uniqueness"
                        : state.creationStage == 2
                            ? "Race"
                            : state.creationStage == 3
                                ? "Gender & Name"
                                : state.creationStage == 4
                                    ? "${state.newName} ${state.newLastName} - Combat Style"
                                    : state.creationStage == 5
                                        ? "${state.newName} ${state.newLastName} - Class"
                                        : state.creationStage == 6
                                            ? "${state.newName} ${state.newLastName} - Combat Equip"
                                            : state.creationStage == 7
                                                ? "${state.newName} ${state.newLastName} - Aligment"
                                                : state.creationStage == 8
                                                    ? "${state.newName} ${state.newLastName} - Level"
                                                    : "Stats generator"),
                ProgressionBar(
                  controller: state,
                ),
                if (state.creationStage != 9)
                  CharacterInfoBar(
                      race:
                          state.creationStage > 2 ? state.chosenRace.name : "",
                      gender: state.creationStage < 4
                          ? ""
                          : state.isMale
                              ? "Male"
                              : "Female",
                      className: state.creationStage > 4
                          ? state.chosenClass.name
                          : ""),
                SizedBox(height: size.height * 0.01),
                if (state.creationStage == 1) const Center(),
                if (state.creationStage == 2) const RaceSelection(),
                if (state.creationStage == 3)
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
                if (state.creationStage == 4) const CombatStyleSection(),
                if (state.creationStage == 5) const ClassSelection(),
                if (state.creationStage == 6) const CombatEquipSection(),
                if (state.creationStage == 7) const AlignmentSelection(),
                if (state.creationStage == 8) const LevelSelection(),
                if (state.creationStage == 9) const StatsSection(),
              ],
            );
          }),
        ),
        bottomNavigationBar: const GenerationBottomNav());
  }
}
