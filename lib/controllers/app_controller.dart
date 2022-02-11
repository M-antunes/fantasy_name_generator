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
  int randomTry = 0;
  String newName = ' - ? - ';

  updateChosenRace(RaceModel race) {
    chosenRace = race;
    notifyListeners();
  }

  updateNewName(String randomName) {
    newName = randomName;
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
    randomTry = randomIndex.nextInt(13);

    if (randomTry == 0 || randomTry == 1) {
      newName = randomVowel().toUpperCase() + randomConsonant() + randomVowel();
      notifyListeners();
      return;
    }
    if (randomTry == 2) {
      newName =
          randomConsonant().toUpperCase() + randomVowel() + randomSemiVowel();
      notifyListeners();
      return;
    }
    if (randomTry == 3) {
      newName = randomVowel().toUpperCase() +
          randomConsonant() +
          randomVowel() +
          randomSemiVowel();
      notifyListeners();
      return;
    }
    if (randomTry == 4 || randomTry == 5) {
      newName = randomConsonant().toUpperCase() +
          randomConsonantCluster() +
          randomVowel() +
          randomSemiVowel();
      notifyListeners();
      return;
    }
    if (randomTry == 6) {
      newName = randomConsonant().toUpperCase() +
          randomConsonantCluster() +
          randomVowel() +
          randomConsonant();
      notifyListeners();
      return;
    }
    if (randomTry == 7) {
      newName = randomConsonant().toUpperCase() +
          randomConsonantCluster() +
          randomVowel() +
          randomConsonant() +
          randomSemiVowel();
      notifyListeners();
      return;
    }
    if (randomTry == 8) {
      newName = randomConsonant().toUpperCase() +
          randomVowel() +
          randomVowel() +
          randomConsonant() +
          randomVowel();
      notifyListeners();
      return;
    }
    if (randomTry == 9) {
      newName = randomConsonant().toUpperCase() +
          randomVowel() +
          randomVowel() +
          randomConsonant() +
          randomVowel() +
          randomConsonant();
      notifyListeners();
      return;
    }
    if (randomTry == 10) {
      newName = randomConsonant().toUpperCase() +
          randomConsonantCluster() +
          randomVowel() +
          randomConsonant() +
          randomVowel();
      notifyListeners();
      return;
    }
    if (randomTry == 11) {
      newName = randomConsonant().toUpperCase() +
          randomConsonantCluster() +
          randomVowel() +
          randomConsonant() +
          randomVowel() +
          randomConsonant();
      notifyListeners();
      return;
    }
    if (randomTry == 12) {
      newName = randomVowel().toUpperCase() +
          randomConsonant() +
          randomConsonantCluster() +
          randomVowel() +
          randomVowel();
      notifyListeners();
      return;
    }
    if (randomTry == 13) {
      newName = randomVowel().toUpperCase() +
          randomConsonant() +
          randomConsonantCluster() +
          randomVowel() +
          randomVowel() +
          randomConsonant();
      notifyListeners();
      return;
    }
  }
}
