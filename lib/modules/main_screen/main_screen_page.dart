import 'package:fantasy_name_generator/controllers/names_controller.dart';
import 'package:fantasy_name_generator/modules/selections/gender_selection.dart';
import 'package:fantasy_name_generator/modules/selections/race_selection.dart';
import 'package:fantasy_name_generator/modules/selections/race_selection.dart';
import 'package:fantasy_name_generator/modules/selections/widgets/selection_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  _MainScreenPageState createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage>
    with TickerProviderStateMixin {
  late final NamesController namesController;

  @override
  void initState() {
    namesController = context.read<NamesController>();
    namesController.getInitialRace();
    namesController.loadStoredNames();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int _currentStep = 2;
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: size.width * 0.6,
          child: const FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('Fantasy Character Generator'),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
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
                totalSteps: 6,
                currentStep: _currentStep,
                selectedColor: Colors.yellow[700]!,
                selectedSize: 8,
              ),
            ),
          ),
          SelectionLabel(
              size: size,
              label: _currentStep == 1
                  ? "Select Race"
                  : _currentStep == 2
                      ? "Select Gender"
                      : ''),
          if (_currentStep == 1) Expanded(child: RaceSelection()),
          if (_currentStep == 2) Expanded(child: GenderSelection()),
        ],
      ),
    );
  }
}
