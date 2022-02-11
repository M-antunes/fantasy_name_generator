import 'package:fantasy_name_generator/controllers/race_controller.dart';
import 'package:fantasy_name_generator/models/race_model.dart';
import 'package:flutter/cupertino.dart';

class Controller extends ChangeNotifier {
  late RaceModel chosenRace;
  bool readyToSwitchRace = false;
  var listOfRaces = RaceController();

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
