import 'package:fantasy_name_generator/modules/selection_sections/race_selection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/modules/main_screen/widgets/progression_bar.dart';
import 'package:fantasy_name_generator/modules/main_screen/widgets/selection_label.dart';
import 'package:fantasy_name_generator/modules/selection_sections/alignment_selection.dart';
import 'package:fantasy_name_generator/modules/selection_sections/class_section.dart';
import 'package:fantasy_name_generator/modules/selection_sections/gender_section.dart';
import 'package:fantasy_name_generator/modules/selection_sections/level_section.dart';
import 'package:fantasy_name_generator/modules/selection_sections/name_section.dart';
import 'package:fantasy_name_generator/modules/selection_sections/widgets/race_list.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';

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
      appBar: AppBar(
        title: SizedBox(
          width: size.width * 0.6,
          child: const FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('Fantasy Character Generator'),
          ),
        ),
        leading: Consumer<CharController>(builder: (context, state, child) {
          return IconButton(
            onPressed: () {
              if (state.creationStage == 1) {
                Navigator.of(context).pop();
              } else if (state.creationStage == 7) {
                state.retreatCreationStage();
              } else {
                state.retreatCreationStage();
              }
            },
            icon: Icon(state.creationStage == 1
                ? Icons.arrow_back
                : Icons.arrow_back_ios_outlined),
          );
        }),
        centerTitle: true,
      ),
      body: Consumer<CharController>(builder: (context, state, child) {
        return ListView(
          children: [
            ProgressionBar(
              controller: state,
            ),
            SelectionLabel(
                size: size,
                label: state.creationStage == 1
                    ? "Race"
                    : state.creationStage == 2
                        ? "Gender"
                        : state.creationStage == 3
                            ? "Name"
                            : state.creationStage == 4
                                ? "Class"
                                : state.creationStage == 5
                                    ? "Alignment"
                                    : state.creationStage == 6
                                        ? "Level"
                                        : state.creationStage == 7
                                            ? "Stats"
                                            : state.creationStage == 8
                                                ? "Basic features ready"
                                                : ''),
            if (state.creationStage == 1)
              RaceSelection(size: size, state: state),
            if (state.creationStage == 2)
              GenderSelection(
                onTap: () {
                  state.advanceCreationStage();
                },
              ),
            if (state.creationStage == 3)
              NameSelection(
                onGenerate: () => namesController.newNameGenerator(),
                onSelect: () => state.advanceCreationStage(),
              ),
            if (state.creationStage == 4)
              ClassSelection(onTap: () {
                state.updateChosenClass();
                state.filterAlignmentsToClass();
                state.advanceCreationStage();
              }),
            if (state.creationStage == 5)
              AlignmentSelection(
                onTap: () {
                  state.updateChosenAlignment();
                  state.advanceCreationStage();
                },
              ),
            if (state.creationStage == 6)
              LevelSelection(onTap: () {
                if (state.levelSelected == -1) {
                  state.showErrorSnackBarIfLevelIsZero(
                    context,
                    "You need to select a level befor advancing",
                    AppColors.warningColor,
                  );
                  return;
                }
                state.updateLevelSelectedIfEpic();
                state.updateCharModel();
                state.advanceCreationStage();
              }),
            if (state.creationStage == 7)
              CharProgression(onGenerate: () {
                state.generateAllAtributs();
                state.claculatingHitDefense();
                state.calculateResistances();
              }, onTap: () {
                state.advanceCreationStage();
              }),
          ],
        );
      }),
    );
  }
}
