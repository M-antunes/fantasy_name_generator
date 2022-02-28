import 'package:fantasy_name_generator/models/race_model.dart';

class RaceData {
  List<RaceModel> races = [
    RaceModel(
      name: 'Human',
      isSelected: true,
    ),
    RaceModel(
      name: 'Orc',
      isSelected: false,
    ),
    RaceModel(
      name: 'Elf',
      isSelected: false,
    ),
    RaceModel(
      name: 'Dwarf',
      isSelected: false,
    ),
    RaceModel(
      name: 'Gnome',
      isSelected: false,
    ),
    RaceModel(
      name: 'Hafling',
      isSelected: false,
    ),
  ];
}
