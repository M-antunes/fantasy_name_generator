import 'dart:math';

import 'package:fantasy_name_generator/shared/data/letters_data.dart';
import 'package:fantasy_name_generator/shared/data/race_data.dart';
import 'package:fantasy_name_generator/models/race_model.dart';
import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {
  late RaceModel chosenRace;
  bool readyToSwitchRace = false;
  var listOfRaces = RaceData();
  var letters = LettersData();
  Random randomIndex = Random();
  int nameLength = 0;
  List<int> randomChance = [3, 4, 5, 6, 7, 8];
  String newName = ' - ? - ';
  bool isMale = true;
  bool isFemale = false;

  updateChosenRace(RaceModel race) {
    chosenRace = race;
    if (race.name == 'Orc') {
      randomChance = [0, 1, 2, 3, 4, 4, 4, 5, 5];
      notifyListeners();
    }
    if (race.name == 'Hobbit' || race.name == 'Gnome') {
      randomChance = [7, 8, 9, 10, 10, 10, 11, 11, 12, 12, 12, 13, 13, 14, 14];
      notifyListeners();
    }
    if (race.name == 'Dwarf') {
      randomChance = [5, 6, 6, 7, 7, 7, 8, 8, 9, 9, 10, 10, 11];
      notifyListeners();
    }
    if (race.name == 'Elf') {
      randomChance = [8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14];
      notifyListeners();
    }
  }

  switchToMale() {
    isMale = true;
    isFemale = false;
    newName = ' - ? - ';
    notifyListeners();
  }

  switchToFemale() {
    isFemale = true;
    isMale = false;
    newName = ' - ? - ';
    notifyListeners();
  }

  String randomVowel() {
    dynamic randomVowel;
    int index = randomIndex.nextInt(letters.vowels.length);
    for (var ind in letters.vowels) {
      if (ind.id == index) {
        randomVowel = ind;
      }
    }
    return randomVowel.value;
  }

  String randomSemiVowel() {
    dynamic randomSemiVowel;
    int index = randomIndex.nextInt(letters.semiVowels.length);
    for (var ind in letters.semiVowels) {
      if (ind.id == index) {
        randomSemiVowel = ind;
      }
    }
    return randomSemiVowel.value;
  }

  String randomConsonant() {
    dynamic randomConsonant;
    int index = randomIndex.nextInt(letters.consonants.length);
    for (var ind in letters.consonants) {
      if (ind.id == index) {
        randomConsonant = ind;
      }
    }
    return randomConsonant.value;
  }

  String randomConsonantCluster() {
    dynamic randomConsonantCluster;
    int index = randomIndex.nextInt(letters.consonantCluster.length);
    for (var ind in letters.consonantCluster) {
      if (ind.id == index) {
        randomConsonantCluster = ind;
      }
    }
    return randomConsonantCluster.value;
  }

  newNameGenerator() {
    nameLength = randomIndex.nextInt(randomChance.length);

    if (nameLength == 0) {
      newName = randomVowel().toUpperCase() + randomConsonant() + randomVowel();
      notifyListeners();
      return;
    }
    if (nameLength == 1) {
      newName =
          randomConsonant().toUpperCase() + randomVowel() + randomSemiVowel();
      notifyListeners();
      return;
    }
    if (nameLength == 2) {
      newName = randomVowel().toUpperCase() +
          randomConsonant() +
          randomVowel() +
          randomSemiVowel();
      notifyListeners();
      return;
    }
    if (nameLength == 3) {
      newName = randomConsonant().toUpperCase() +
          randomConsonantCluster() +
          randomVowel() +
          randomSemiVowel();
      notifyListeners();
      return;
    }
    if (nameLength == 4) {
      newName = randomConsonant().toUpperCase() +
          randomConsonantCluster() +
          randomVowel() +
          randomConsonant();
      notifyListeners();
      return;
    }
    if (nameLength == 5) {
      newName = randomConsonant().toUpperCase() +
          randomConsonantCluster() +
          randomVowel() +
          randomConsonant() +
          randomSemiVowel();
      notifyListeners();
      return;
    }
    if (nameLength == 6) {
      newName = randomConsonant().toUpperCase() +
          randomVowel() +
          randomSemiVowel() +
          randomConsonant() +
          randomVowel();
      notifyListeners();
      return;
    }
    if (nameLength == 7) {
      newName = randomConsonant().toUpperCase() +
          randomVowel() +
          randomSemiVowel() +
          randomConsonant() +
          randomVowel() +
          randomConsonant();
      notifyListeners();
      return;
    }
    if (nameLength == 8) {
      newName = randomConsonant().toUpperCase() +
          randomConsonantCluster() +
          randomVowel() +
          randomConsonant() +
          randomVowel();
      notifyListeners();
      return;
    }
    if (nameLength == 9) {
      newName = randomConsonant().toUpperCase() +
          randomConsonantCluster() +
          randomVowel() +
          randomConsonant() +
          randomVowel() +
          randomConsonant();
      notifyListeners();
      return;
    }
    if (nameLength == 10) {
      newName = randomVowel().toUpperCase() +
          randomConsonant() +
          randomConsonantCluster() +
          randomVowel() +
          randomSemiVowel();
      notifyListeners();
      return;
    }
    if (nameLength == 11) {
      newName = randomVowel().toUpperCase() +
          randomConsonant() +
          randomConsonantCluster() +
          randomVowel() +
          randomVowel() +
          randomConsonant();
      notifyListeners();
      return;
    }
    if (nameLength == 12) {
      newName = randomVowel().toUpperCase() +
          randomConsonant() +
          randomConsonantCluster() +
          randomVowel() +
          randomSemiVowel() +
          randomConsonant() +
          randomVowel();
      notifyListeners();
      return;
    }
    if (nameLength == 13) {
      newName = randomConsonant().toUpperCase() +
          randomVowel() +
          randomSemiVowel() +
          randomConsonant() +
          randomConsonantCluster() +
          randomVowel();
      notifyListeners();
      return;
    }
    if (nameLength == 14) {
      newName = randomConsonant().toUpperCase() +
          randomVowel() +
          randomSemiVowel() +
          randomConsonant() +
          randomConsonantCluster() +
          randomVowel() +
          randomConsonant();
      notifyListeners();
      return;
    }
  }
}
