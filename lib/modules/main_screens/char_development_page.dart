import 'package:fantasy_name_generator/shared/routes/app_roues.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/modules/main_screens/widgets/progression_bar.dart';
import 'package:fantasy_name_generator/modules/main_screens/widgets/char_selection_label.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:fantasy_name_generator/shared/widgets/app_animated_button.dart';
import 'package:fantasy_name_generator/shared/widgets/call_message_snackbar.dart';

import '../selection_sections/char_selection_sections/alignment_section.dart';
import '../selection_sections/char_selection_sections/class_section.dart';
import '../selection_sections/char_selection_sections/gender_section.dart';
import '../selection_sections/char_selection_sections/level_section.dart';
import '../selection_sections/char_selection_sections/name_section.dart';
import '../selection_sections/char_selection_sections/race_section.dart';
import '../selection_sections/char_selection_sections/stats_section.dart';

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
    namesController.getInitialRace();
    namesController.getInitialClass();
    namesController.getInitialAlignment();
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
                      ? "Character - Race"
                      : state.creationStage == 2
                          ? "Character - Gender & Name"
                          : state.creationStage == 3
                              ? "Character - Class"
                              : state.creationStage == 4
                                  ? "Character - Alignment"
                                  : state.creationStage == 5
                                      ? "Character - Level"
                                      : state.creationStage == 6 &&
                                              state.isCharGeneratorCleared
                                          ? "Character - Basic features generator"
                                          : 'Character - Basic features complete'),
              ProgressionBar(
                controller: state,
              ),
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
              if (state.creationStage == 3) const ClassSelection(),
              if (state.creationStage == 4) const AlignmentSelection(),
              if (state.creationStage == 5) const LevelSelection(),
              if (state.creationStage == 6)
                StatsSection(
                  onGenerate: state.isCharGeneratorCleared
                      ? () {
                          state.generateAllAtributs();
                          state.isCharGeneratorCleared =
                              !state.isCharGeneratorCleared;
                        }
                      : () {
                          state.updateCharModel();
                        },
                ),
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
                    } else if (state.creationStage == 6) {
                      state.resetLevel();
                      state.retreatCreationStage();
                    } else {
                      state.retreatCreationStage();
                    }
                  }),
              state.creationStage == 6
                  ? AppAnimatedButton(
                      onTap: () => Navigator.pushNamed(
                          context, AppRoutes.equipPage,
                          arguments: state.generatedChar),
                    )
                  : AppAnimatedButton(
                      color: state.isCharGeneratorCleared &&
                              state.creationStage == 6
                          ? Colors.white10
                          : null,
                      onTap: !state.isCharGeneratorCleared &&
                              state.creationStage != 6
                          ? () => buttonFunction(state, context)
                          : !state.isCharGeneratorCleared &&
                                  state.creationStage == 6
                              ? () => buttonFunction(state, context)
                              : state.isCharGeneratorCleared &&
                                      state.creationStage != 6
                                  ? () => buttonFunction(state, context)
                                  : () {},
                      style: state.isCharGeneratorCleared &&
                              state.creationStage == 6
                          ? const TextStyle(color: Colors.white24, fontSize: 22)
                          : null,
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
