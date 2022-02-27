import 'package:fantasy_name_generator/modules/selection_sections/alignment_selection.dart';
import 'package:fantasy_name_generator/modules/selection_sections/level%20selection.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/modules/selection_sections/class_selection.dart';
import 'package:fantasy_name_generator/modules/selection_sections/gender_selection.dart';
import 'package:fantasy_name_generator/modules/selection_sections/name_selection.dart';
import 'package:fantasy_name_generator/modules/selection_sections/race_selection.dart';
import 'package:fantasy_name_generator/modules/selection_sections/widgets/selection_label.dart';
import 'widgets/char_progression.dart';

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
    namesController.loadStoredNames();
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
            CharProgression(
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
                                        : ''),
            if (state.creationStage == 1)
              RaceSelection(
                onTap: () {
                  state.updateChosenRace();
                  state.advanceCreationStage();
                },
              ),
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
                state.advanceCreationStage();
              }),
          ],
        );
      }),
    );
  }
}
