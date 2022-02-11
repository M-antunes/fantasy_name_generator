import 'package:fantasy_name_generator/models/race_model.dart';

class RaceData {
  List<RaceModel> races = [
    RaceModel(
      id: 0,
      name: 'Human',
      picture: 'assets/images/human.jpg',
      isSelected: true,
    ),
    RaceModel(
      id: 1,
      name: 'Orc',
      isSelected: false,
      picture: 'assets/images/orc.jpg',
    ),
    RaceModel(
      id: 2,
      name: 'Elf',
      isSelected: false,
      picture: 'assets/images/elf.jpg',
    ),
    RaceModel(
      id: 3,
      name: 'Dwarf',
      isSelected: false,
      picture: 'assets/images/dwarf.jpg',
    ),
    RaceModel(
      id: 4,
      name: 'Gnome',
      isSelected: false,
      picture: 'assets/images/gnome.jpg',
    ),
    RaceModel(
      id: 5,
      name: 'Hobbit',
      isSelected: false,
      picture: 'assets/images/hobbit.jpg',
    ),
    RaceModel(
      id: 6,
      name: 'Goblin',
      isSelected: false,
      picture: 'assets/images/goblin.jpg',
    ),
    RaceModel(
      id: 7,
      name: 'Dragon',
      isSelected: false,
      picture: 'assets/images/dragon.jpg',
    ),
  ];
}
