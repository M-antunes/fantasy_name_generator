import 'package:fantasy_name_generator/modules/selection_sections/alignment_selection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/modules/selection_sections/class_selection.dart';
import 'package:fantasy_name_generator/modules/selection_sections/gender_selection.dart';
import 'package:fantasy_name_generator/modules/selection_sections/name_selection.dart';
import 'package:fantasy_name_generator/modules/selection_sections/race_selection.dart';
import 'package:fantasy_name_generator/modules/selection_sections/widgets/selection_label.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

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
        return Column(
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
                                    : ''),
            if (state.creationStage == 1)
              Expanded(child: RaceSelection(
                onTap: () {
                  state.updateChosenRace();
                  state.advanceCreationStage();
                },
              )),
            if (state.creationStage == 2)
              Expanded(child: GenderSelection(
                onTap: () {
                  state.advanceCreationStage();
                },
              )),
            if (state.creationStage == 3)
              Expanded(
                  child: NameSelection(
                onGenerate: () => namesController.newNameGenerator(),
                onSelect: () => state.advanceCreationStage(),
              )),
            if (state.creationStage == 4)
              Expanded(child: ClassSelection(onTap: () {
                state.updateChosenClass();
                state.advanceCreationStage();
              })),
            if (state.creationStage == 5)
              Expanded(child: AlignmentSelection(
                onTap: () {
                  state.updateChosenAlignment();
                  state.advanceCreationStage();
                },
              ))
          ],
        );
      }),
    );
  }
}

class CharProgression extends StatelessWidget {
  final CharController controller;
  const CharProgression({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(6),
                child: CircleAvatar(
                    child: Text(
                      controller.creationStage > 1
                          ? controller.tempRaceForSwitching.name
                          : '',
                      style: AppTextStyle.chosenRace,
                    ),
                    backgroundColor: Colors.black,
                    radius: 45),
              ),
              SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (controller.creationStage > 2)
                    Text(controller.isMale ? "Male" : "Female"),
                  if (controller.creationStage > 3)
                    Text(
                      "${controller.newName} ${controller.newLastName}",
                      style: AppTextStyle.changeRace,
                    ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      if (controller.creationStage > 4)
                        Text("${controller.chosenClass.name}",
                            style: AppTextStyle.selectRace),
                      SizedBox(width: 20),
                      if (controller.creationStage > 5)
                        Text("${controller.chosenAlignment.name}",
                            style: AppTextStyle.selectRace),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StepProgressIndicator(
              roundedEdges: Radius.circular(10),
              totalSteps: 11,
              currentStep: controller.creationStage,
              selectedColor: AppColors.primary,
              selectedSize: 8,
            ),
          ),
        ],
      ),
    );
  }
}
