import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/controllers/app_controller.dart';
import 'package:fantasy_name_generator/models/race_model.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class BottomSheetRace extends StatefulWidget {
  final Size size;
  final AppController controller;
  const BottomSheetRace({
    Key? key,
    required this.size,
    required this.controller,
  }) : super(key: key);

  @override
  State<BottomSheetRace> createState() => _BottomSheetRaceState();
}

class _BottomSheetRaceState extends State<BottomSheetRace> {
  late RaceModel temporaryChosenRace;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: widget.size.height * 0.01),
        Container(
          width: widget.size.width * 0.5,
          height: widget.size.height * 0.003,
          color: Colors.grey,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: widget.size.height * 0.01,
          ),
          child: const Text(
            "Select Race",
            style: AppTextStyle.changeRace,
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: widget.controller.listOfRaces.races.length,
              itemBuilder: (context, index) {
                var race = widget.controller.listOfRaces.races[index];
                return InkWell(
                  child: Card(
                    color: race.isSelected ? Colors.red[900] : Colors.grey[700],
                    elevation: 12,
                    margin: EdgeInsets.symmetric(
                        horizontal: widget.size.width * 0.1,
                        vertical: widget.size.height * 0.008),
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
                      for (var select in widget.controller.listOfRaces.races) {
                        select.isSelected = false;
                      }
                      race.isSelected = !race.isSelected;
                      temporaryChosenRace = race;
                    });
                  },
                );
              }),
        ),
        InkWell(
          child: Container(
            width: double.infinity,
            height: widget.size.height * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[800],
              border: Border.all(color: Colors.red[900]!, width: 2),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: widget.size.width * 0.3,
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
            widget.controller.updateChosenRace(temporaryChosenRace);
            widget.controller.newName = ' - ? - ';
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
