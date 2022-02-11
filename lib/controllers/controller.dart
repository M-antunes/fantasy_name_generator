import 'package:fantasy_name_generator/models/race_model.dart';
import 'package:flutter/cupertino.dart';

class Controller extends ChangeNotifier {
  late RaceModel chosenRace;
  bool readyToSwitchRace = false;

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
  ];

  List<String> vowels = [
    'a',
    'e',
    'i',
    'o',
    'u',
  ];

  List<String> consonants = [
    'b',
    'c',
    'd',
    'f',
    'g',
    'h',
    'j',
    'k',
    'l',
    'm',
    'n',
    'p',
    'q',
    'r',
    's',
    't',
    'v',
    'x',
    'w',
    'y',
    'z'
  ];

  updateChosenRace(RaceModel race) {
    chosenRace = race;
    notifyListeners();
  }
}
