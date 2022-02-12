import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

import 'package:fantasy_name_generator/controllers/app_controller.dart';
import 'package:fantasy_name_generator/models/race_model.dart';
import 'package:fantasy_name_generator/modules/drawer/app_drawer.dart';
import 'package:fantasy_name_generator/modules/home/widget/bottom_sheet_race.dart';
import 'package:fantasy_name_generator/modules/home/widget/name_generator_set.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool genderSelect = true;
  bool isFemaleSet = false;

  late final AppController appController;
  late final RaceModel initialRace;

  @override
  void initState() {
    appController = context.read<AppController>();
    initialRace = appController.listOfRaces.races[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: AppDrawer(size: size),
      appBar: AppBar(
        title: SizedBox(
          width: size.width * 0.6,
          child: const FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('Fantasy Name Generator'),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer<AppController>(builder: (context, state, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GenderButton(
                    genderSelect: state.isMale,
                    gender: 'Male',
                    state: state,
                    onTap: () => state.switchToMale(),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: appController.readyToSwitchRace
                          ? Text("${state.chosenRace.name} Names")
                          : Text("${initialRace.name} Names"),
                    ),
                  ),
                  GenderButton(
                    genderSelect: state.isFemale,
                    gender: 'Female',
                    state: state,
                    onTap: () => state.switchToFemale(),
                  ),
                ],
              );
            }),
          ),
          SizedBox(height: size.height * 0.01),
          NameGeneratorSet(
            size: size,
            initialRace: initialRace,
            controller: appController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: SizedBox(
                    height: size.height * 0.037,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        'Change Race',
                        style: AppTextStyle.changeRace,
                      ),
                    ),
                  ),
                  onTap: () {
                    appController.readyToSwitchRace = true;
                    showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return StatefulBuilder(builder: (context, setState) {
                          return BottomSheetRace(
                            size: size,
                            controller: appController,
                          );
                        });
                      },
                    );
                  }),
              TextButton(
                child: Text(
                  'Save\nName',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.generatedName,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  final bool genderSelect;
  final AppController state;
  final String gender;
  final VoidCallback onTap;
  const GenderButton({
    Key? key,
    required this.genderSelect,
    required this.state,
    required this.gender,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      radius: 0,
      onTap: onTap,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: state.isMale ? 0 : 20,
          child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(20),
                border: genderSelect
                    ? Border.all(color: Colors.red[900]!, width: 2)
                    : Border.all(color: Colors.transparent),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Text(
                  gender,
                  style: AppTextStyle.flipCardFemale,
                ),
              ))),
    );
  }
}
