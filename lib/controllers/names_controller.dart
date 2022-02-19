import 'dart:math';

import 'package:fantasy_name_generator/models/consonant_model.dart';
import 'package:fantasy_name_generator/shared/data/human_names_data.dart';
import 'package:fantasy_name_generator/shared/data/letters_data.dart';
import 'package:fantasy_name_generator/shared/data/race_data.dart';
import 'package:fantasy_name_generator/models/race_model.dart';
import 'package:flutter/cupertino.dart';

class NamesController extends ChangeNotifier {
  late RaceModel chosenRace;
  bool readyToSwitchRace = false;
  var listOfRaces = RaceData();
  var letters = LettersData();
  var humanNames = HumanNamesData();
  late RaceModel initialRace;
  Random randomIndex = Random();
  int nameLength = 0;
  int randomChance = 0;
  String newName = ' - ? - ';
  bool isMale = true;
  bool isFemale = false;

  getInitialRace() {
    initialRace = listOfRaces.races[0];
    chosenRace = initialRace;
  }

  updateChosenRace(RaceModel race) {
    chosenRace = race;
    notifyListeners();
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

  getVowel() {
    List<LetterModel> vowelList = [];
    for (var n in letters.alphabet) {
      if (n.type == LetterOrSyllabus.vowel) {
        vowelList.add(n);
      }
    }
    var chance = randomIndex.nextInt(vowelList.length);
    return vowelList[chance].value;
  }

  getConsonant() {
    List<LetterModel> consonantList = [];
    for (var n in letters.alphabet) {
      if (n.type == LetterOrSyllabus.consonant) {
        consonantList.add(n);
      }
    }
    var chance = randomIndex.nextInt(consonantList.length);
    return consonantList[chance].value;
  }

  getSyllabus() {
    List<LetterModel> syllabusList = [];
    for (var n in letters.syllabus) {
      if (n.type == LetterOrSyllabus.twoLetterSyllabus) {
        syllabusList.add(n);
      }
    }
    var chance = randomIndex.nextInt(syllabusList.length);
    return syllabusList[chance].value;
  }

  getThreeLetterSyllabous() {
    List<LetterModel> threeSyllabusList = [];
    for (var n in letters.syllabus) {
      if (n.type == LetterOrSyllabus.threeLetterSyllabus) {
        threeSyllabusList.add(n);
      }
    }
    var chance = randomIndex.nextInt(threeSyllabusList.length);
    return threeSyllabusList[chance].value;
  }

  generateNameSize() {}

  humanNameGenerator() {
    var previousName = newName;
    var nameChance = randomIndex.nextInt(humanNames.maleNames.length);
    newName = humanNames.maleNames[nameChance];
    while (newName == previousName) {
      var nameChance = randomIndex.nextInt(humanNames.maleNames.length);
      newName = humanNames.maleNames[nameChance];
    }
    notifyListeners();
  }

  orcNameGenerator() {
    randomChance = randomIndex.nextInt(2) + 2;
    String temporaryName = '';
    for (var i = 0; i < randomChance; i++) {
      List<dynamic> letterPicker = [
        getVowel(),
        getSyllabus(),
        getSyllabus(),
        getThreeLetterSyllabous(),
        getThreeLetterSyllabous(),
      ];
      letterPicker.shuffle();
      var mutableIndex = randomIndex.nextInt(4);
      temporaryName = temporaryName + letterPicker[mutableIndex];
    }
    newName = temporaryName;
    notifyListeners();
  }

  newNameGenerator() {
    if (chosenRace.name == "Human") {
      humanNameGenerator();
      return;
    }
    if (chosenRace.name == "Orc") {
      orcNameGenerator();
      return;
    }
  }
}
