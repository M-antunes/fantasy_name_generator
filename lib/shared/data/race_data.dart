import 'package:fantasy_name_generator/models/race_model.dart';

class RaceData {
  List<RaceModel> races = [
    RaceModel(
      name: 'Human',
      malePicture: 'assets/images/human.jpg',
      femalePicture: 'assets/images/human2.jpg',
      isSelected: true,
    ),
    RaceModel(
      name: 'Orc',
      isSelected: false,
      malePicture: 'assets/images/orc.jpg',
      femalePicture: 'assets/images/orc2.jpg',
    ),
    RaceModel(
      name: 'Elf',
      isSelected: false,
      malePicture: 'assets/images/elf.jpg',
      femalePicture: 'assets/images/elf2.jpg',
    ),
    RaceModel(
      name: 'Dwarf',
      isSelected: false,
      malePicture: 'assets/images/dwarf.jpg',
      femalePicture: 'assets/images/dwarf2.jpg',
    ),
    RaceModel(
      name: 'Gnome',
      isSelected: false,
      malePicture: 'assets/images/gnome.jpg',
      femalePicture: 'assets/images/gnome2.jpg',
    ),
    RaceModel(
      name: 'Hafling',
      isSelected: false,
      malePicture: 'assets/images/hobbit.jpg',
      femalePicture: 'assets/images/hobbit2.jpg',
    ),
  ];
}
