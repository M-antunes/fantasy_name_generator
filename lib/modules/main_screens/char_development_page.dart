import 'package:fantasy_name_generator/shared/routes/app_roues.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/modules/main_screens/widgets/progression_bar.dart';
import 'package:fantasy_name_generator/modules/main_screens/widgets/selection_label.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:fantasy_name_generator/shared/widgets/app_animated_button.dart';
import 'package:fantasy_name_generator/shared/widgets/call_message_snackbar.dart';

import '../selection_sections/char_selection_sections/alignment_section.dart';
import '../selection_sections/char_selection_sections/class_section.dart';
import '../selection_sections/char_selection_sections/gender_section.dart';
import '../selection_sections/char_selection_sections/level_section.dart';
import '../selection_sections/char_selection_sections/name_section.dart';
import '../selection_sections/char_selection_sections/progress_check.dart';
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
      body: Consumer<CharController>(builder: (context, state, child) {
        return ListView(
          children: [
            SelectionLabel(
                size: size,
                label: state.creationStage == 1
                    ? "Race"
                    : state.creationStage == 2
                        ? "Gender & Name"
                        : state.creationStage == 3
                            ? "Class"
                            : state.creationStage == 4
                                ? "Alignment"
                                : state.creationStage == 5
                                    ? "Level"
                                    : state.creationStage == 6
                                        ? "Stats"
                                        : state.creationStage == 7
                                            ? "Basic features ready"
                                            : ''),
            ProgressionBar(
              controller: state,
            ),
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
                            AppColors.warningColor)
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
            if (state.creationStage == 7) ProgressCheck(),
          ],
        );
      }),
      bottomNavigationBar:
          Consumer<CharController>(builder: (context, state, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
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
              state.creationStage == 7
                  ? AppAnimatedButton(
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.equipPage),
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
      callMessageSnackbar(context, text, AppColors.warningColor);
    }
  }
}
