import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/modules/selection_sections/name_selection.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:fantasy_name_generator/modules/selection_sections/race_selection.dart';
import 'package:fantasy_name_generator/modules/selection_sections/widgets/selection_label.dart';
import 'package:fantasy_name_generator/modules/selection_sections/gender_selection.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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
    namesController.loadStoredNames();
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
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: StepProgressIndicator(
                  roundedEdges: Radius.circular(10),
                  totalSteps: 6,
                  currentStep: state.creationStage,
                  selectedColor: AppColors.primary,
                  selectedSize: 8,
                ),
              ),
            ),
            SelectionLabel(
                size: size,
                label: state.creationStage == 1
                    ? "Select Race"
                    : state.creationStage == 2
                        ? "Select Gender"
                        : state.creationStage == 3
                            ? "Create Name"
                            : ''),
            if (state.creationStage == 1)
              Expanded(child: RaceSelection(
                onTap: () {
                  namesController.updateChosenRace();
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
                  child: NameSection(
                onGenerate: () => namesController.newNameGenerator(),
                onSelect: () => state.advanceCreationStage(),
              )),
          ],
        );
      }),
    );
  }
}
