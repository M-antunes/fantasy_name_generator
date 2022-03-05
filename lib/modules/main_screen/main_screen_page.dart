import 'package:fantasy_name_generator/modules/selection_sections/loading_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/modules/main_screen/widgets/progression_bar.dart';
import 'package:fantasy_name_generator/modules/main_screen/widgets/selection_label.dart';
import 'package:fantasy_name_generator/modules/selection_sections/alignment_section.dart';
import 'package:fantasy_name_generator/modules/selection_sections/class_section.dart';
import 'package:fantasy_name_generator/modules/selection_sections/gender_section.dart';
import 'package:fantasy_name_generator/modules/selection_sections/level_section.dart';
import 'package:fantasy_name_generator/modules/selection_sections/name_section.dart';
import 'package:fantasy_name_generator/modules/selection_sections/race_section.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:fantasy_name_generator/shared/widgets/app_animated_button.dart';
import 'package:fantasy_name_generator/shared/widgets/call_message_snackbar.dart';

import '../selection_sections/stats_section.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  _MainScreenPageState createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage>
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
            if (state.creationStage == 3) ClassSelection(),
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
            if (state.creationStage == 7)
              ProgressCheck(
                onAdvance: () => state.advanceCreationStage(),
              ),
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
              AppAnimatedButton(
                color: state.isCharGeneratorCleared && state.creationStage == 6
                    ? Colors.white10
                    : null,
                onTap: !state.isCharGeneratorCleared && state.creationStage != 6
                    ? () => buttonFunction(state, context)
                    : !state.isCharGeneratorCleared && state.creationStage == 6
                        ? () => buttonFunction(state, context)
                        : state.isCharGeneratorCleared &&
                                state.creationStage != 6
                            ? () => buttonFunction(state, context)
                            : () {},
                style: state.isCharGeneratorCleared && state.creationStage == 6
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

class ProgressCheck extends StatelessWidget {
  final VoidCallback onAdvance;
  const ProgressCheck({
    Key? key,
    required this.onAdvance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Your Character has no equipment so far. You can either check it out or advance to equipement",
              textAlign: TextAlign.center,
              style: AppTextStyle.selectButtonReady,
            ),
          ),
          SizedBox(height: size.height * 0.1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppAnimatedButton(
                  label: "Check",
                  onTap: () {
                    showBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: size.height * 0.6,
                            child: ListView(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    width: size.width - 20,
                                    height: size.height * 0.01,
                                    color: AppColors.primaryGold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  }),
              AppAnimatedButton(label: "Advance", onTap: onAdvance),
            ],
          ),
        ],
      ),
    );
  }
}
