import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'package:fantasy_name_generator/controllers/names_controller.dart';
import 'package:fantasy_name_generator/models/race_model.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class RaceSelection extends StatefulWidget {
  const RaceSelection({Key? key}) : super(key: key);

  @override
  State<RaceSelection> createState() => _RaceSelectionState();
}

class _RaceSelectionState extends State<RaceSelection> {
  @override
  Widget build(BuildContext context) {
    final namesController = context.read<NamesController>();
    late RaceModel temporaryChosenRace;

    final size = MediaQuery.of(context).size;
    return SizedBox(
      // height: size.height * 0.7,
      width: double.maxFinite,
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: namesController.listOfRaces.races.length,
              itemBuilder: (context, index) {
                var race = namesController.listOfRaces.races[index];
                temporaryChosenRace = race;
                return InkWell(
                    child: Card(
                      color:
                          race.isSelected ? Colors.red[900] : Colors.grey[700],
                      elevation: 12,
                      margin: EdgeInsets.symmetric(
                          horizontal: size.width * 0.1,
                          vertical: size.height * 0.008),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              race.name,
                              style: AppTextStyle.selectRace,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        race.isSelected = !race.isSelected;
                        for (var select in namesController.listOfRaces.races) {
                          select.isSelected = false;
                        }
                        race.isSelected = !race.isSelected;
                        temporaryChosenRace = race;
                      });
                    });
              }),
          SizedBox(height: size.height * 0.01),
          InkWell(
            child: Container(
              width: double.infinity,
              height: size.height * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[800],
                border: Border.all(color: Colors.red[900]!, width: 2),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.3,
                vertical: 10,
              ),
              child: const Center(
                child: Text(
                  'Select',
                  style: AppTextStyle.selectButtonReady,
                ),
              ),
            ),
            onTap: () {
              namesController.updateChosenRace(temporaryChosenRace);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
