import 'package:fantasy_name_generator/models/race_model.dart';

class RaceData {
  List<RaceModel> races = [
    RaceModel(
      id: 0,
      name: 'Human',
      malePicture: 'assets/images/human.jpg',
      femalePicture: 'assets/images/human2.jpg',
      isSelected: true,
    ),
    RaceModel(
      id: 1,
      name: 'Orc',
      isSelected: false,
      malePicture: 'assets/images/orc.jpg',
      femalePicture: 'assets/images/orc2.jpg',
    ),
    RaceModel(
      id: 2,
      name: 'Elf',
      isSelected: false,
      malePicture: 'assets/images/elf.jpg',
      femalePicture: 'assets/images/elf2.jpg',
    ),
    RaceModel(
      id: 3,
      name: 'Dwarf',
      isSelected: false,
      malePicture: 'assets/images/dwarf.jpg',
      femalePicture: 'assets/images/dwarf2.jpg',
    ),
    RaceModel(
      id: 4,
      name: 'Gnome',
      isSelected: false,
      malePicture: 'assets/images/gnome.jpg',
      femalePicture: 'assets/images/gnome2.jpg',
    ),
    RaceModel(
      id: 5,
      name: 'Hafling',
      isSelected: false,
      malePicture: 'assets/images/hobbit.jpg',
      femalePicture: 'assets/images/hobbit2.jpg',
    ),
  ];
}
