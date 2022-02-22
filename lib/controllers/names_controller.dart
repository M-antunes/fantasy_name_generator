import 'dart:math';

import 'package:fantasy_name_generator/models/letter_model.dart';
import 'package:fantasy_name_generator/models/saved_name_model.dart';
import 'package:fantasy_name_generator/shared/widgets/call_message_snackbar.dart';
import 'package:fantasy_name_generator/shared/data/human_names_data.dart';
import 'package:fantasy_name_generator/shared/data/letters_data.dart';
import 'package:fantasy_name_generator/shared/data/race_data.dart';
import 'package:fantasy_name_generator/models/race_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  String newLastName = ' - ? - ';
  List<SavedNameModel> savedNames = [];
  List<String> fullName = [];
  bool isMale = true;
  bool isFemale = false;
  bool lastNameShown = true;
  bool readyToInvertNames = false;
  bool revert = false;

  getInitialRace() {
    initialRace = listOfRaces.races[0];
    chosenRace = initialRace;
  }

  displayLastName() {
    lastNameShown = !lastNameShown;
    notifyListeners();
  }

  updateReadyToInvert() {
    readyToInvertNames = true;
    notifyListeners();
  }

  /// makes the first letter of a name a capital letter
  capitalize(String name, String lastName) {
    String tempName = name[0].toUpperCase() + name.substring(1).toLowerCase();
    String tempLastName =
        lastName[0].toUpperCase() + lastName.substring(1).toLowerCase();
    newName = tempName;
    newLastName = tempLastName;
    notifyListeners();
  }

  updateChosenRace(RaceModel race) {
    chosenRace = race;
    newName = ' - ? - ';
    newLastName = ' - ? - ';
    notifyListeners();
  }

  switchToMale() {
    isMale = true;
    isFemale = false;
    newName = ' - ? - ';
    newLastName = ' - ? - ';
    notifyListeners();
  }

  switchToFemale() {
    isFemale = true;
    isMale = false;
    newName = ' - ? - ';
    newLastName = ' - ? - ';
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

  getFourLetterSyllabous() {
    List<LetterModel> fourSyllabusList = [];
    for (var n in letters.syllabus) {
      if (n.type == LetterOrSyllabus.fourLetterSyllabus) {
        fourSyllabusList.add(n);
      }
    }
    var chance = randomIndex.nextInt(fourSyllabusList.length);
    return fourSyllabusList[chance].value;
  }

  /// generates name size according to race
  List<String> generateNameSize(int desiredLength, int maxLength) {
    randomChance = randomIndex.nextInt(desiredLength) + 1;
    String temporaryName = '';
    String temporaryLastName = '';
    List<String> temporaryFullName = [];
    for (var i = 0; i < randomChance; i++) {
      List<dynamic> letterPicker = [
        getVowel(),
        getSyllabus(),
        getThreeLetterSyllabous(),
        getFourLetterSyllabous(),
      ];
      var mutableIndexName = randomIndex.nextInt(3);
      var mutableIndexLastName = randomIndex.nextInt(3);
      while (mutableIndexName == mutableIndexLastName) {
        mutableIndexLastName = randomIndex.nextInt(3);
      }
      temporaryName = temporaryName + letterPicker[mutableIndexName];
      temporaryLastName =
          temporaryLastName + letterPicker[mutableIndexLastName];
    }
    temporaryFullName = [temporaryName, temporaryLastName];
    return temporaryFullName;
  }

  /// alter names according to the common race name length
  List<String> alterNameLength(int maxLength, int randomChance,
      String temporaryName, String temporaryLastName) {
    if (temporaryName.length == 3) {
      chosenRace.name == "Elf" ||
              chosenRace.name == "Hafling" ||
              chosenRace.name == "Gnome"
          ? temporaryName = temporaryName + getSyllabus()
          : temporaryName = temporaryName;
    }
    if (temporaryName.length == 2) {
      chosenRace.name == "Elf" || chosenRace.name == "Hafling"
          ? temporaryName = temporaryName +
              getThreeLetterSyllabous() +
              getFourLetterSyllabous()
          : temporaryName = temporaryName + getThreeLetterSyllabous();
    }
    if (temporaryName.length == 1) {
      chosenRace.name == "Elf" || chosenRace.name == "Hafling"
          ? temporaryName = temporaryName +
              getSyllabus() +
              getVowel() +
              getFourLetterSyllabous()
          : temporaryName = temporaryName + getFourLetterSyllabous();
    }
    if (temporaryLastName.length < 3) {
      temporaryLastName = temporaryLastName + getSyllabus();
    }
    if (temporaryName.length > maxLength) {
      temporaryName = temporaryName.substring(1, (randomChance + 2));
    }
    if (temporaryLastName.length > maxLength) {
      temporaryLastName = temporaryLastName.substring(1, (randomChance + 2));
    }

    return [temporaryName, temporaryLastName];
  }

// Dwarf designated part =================================================================

  /// alters some of the characters of names for dwarfs
  List<String> alterDwarfNameCharacters(
      String temporaryName, String temporaryLastName) {
    if (randomChance > 0 && randomChance < 3) {
      temporaryName = temporaryName.replaceFirst('h', "sh");
      temporaryName = temporaryName.replaceAll('h', "ch");
      temporaryLastName = temporaryLastName.replaceFirst('y', "ya");
    } else {
      temporaryName = temporaryName.replaceFirst('h', "ch");
      temporaryName = temporaryName.replaceAll('h', "sh");
      temporaryLastName = temporaryLastName.replaceFirst('y', "yo");
    }
    return [temporaryName, temporaryLastName];
  }

  /// generates names for dwarf
  dwarfNameGenerator() {
    var temporaryFullName = generateNameSize(4, 7);
    fullName = alterNameLength(
        7, randomChance, temporaryFullName[0], temporaryFullName[1]);
    fullName = alterDwarfNameCharacters(fullName[0], fullName[1]);
    capitalize(fullName[0], fullName[1]);
  }

// Elf designated part ======================================================================

  /// alters some of the characters of names for elves
  List<String> alterElfNameCharacters(
      String temporaryName, String temporaryLastName) {
    if (temporaryName.length > 8) {
      temporaryName = temporaryName.substring(randomChance - 2);
    }
    if (randomChance > 0 && randomChance < 4) {
      temporaryName = temporaryName.replaceAll('x', "a");
      temporaryName = temporaryName.replaceAll('r', "l");
      temporaryName = temporaryName.replaceFirst('k', "an");
      temporaryName = temporaryName.replaceFirst('u', "e");
      temporaryName = temporaryName.replaceAll('u', "a");
      temporaryName = temporaryName.replaceAll('q', "l");
      temporaryLastName = temporaryLastName.replaceAll('x', "a");
      temporaryLastName = temporaryLastName.replaceAll('r', "l");
      temporaryLastName = temporaryLastName.replaceFirst('k', "m");
      temporaryLastName = temporaryLastName.replaceFirst('u', "e");
      temporaryLastName = temporaryLastName.replaceAll('u', "a");
      temporaryName = temporaryName.replaceAll('q', "l");
    } else {
      temporaryName = temporaryName.replaceAll('x', "f");
      temporaryName = temporaryName.replaceAll('r', "m");
      temporaryName = temporaryName.replaceFirst('k', "en");
      temporaryName = temporaryName.replaceFirst('u', "a");
      temporaryName = temporaryName.replaceAll('q', "d");
      temporaryName = temporaryName.replaceAll('u', "e");
      temporaryLastName = temporaryLastName.replaceAll('x', "f");
      temporaryLastName = temporaryLastName.replaceAll('r', "m");
      temporaryLastName = temporaryLastName.replaceFirst('k', "d");
      temporaryLastName = temporaryLastName.replaceFirst('u', "a");
      temporaryLastName = temporaryLastName.replaceAll('u', "e");
      temporaryName = temporaryName.replaceAll('q', "d");
    }
    if (temporaryName.endsWith("a") || temporaryName.endsWith("e")) {
      randomChance > 0 && randomChance < 3
          ? temporaryName = temporaryName + "l"
          : randomChance > 0 && randomChance < 5
              ? temporaryName = temporaryName + "s"
              : temporaryName = temporaryName + "";
    }

    return [temporaryName, temporaryLastName];
  }

  /// generates names for elves
  elfNameGenerator() {
    var temporaryFullName = generateNameSize(5, 8);
    fullName = alterNameLength(
        7, randomChance, temporaryFullName[0], temporaryFullName[1]);
    fullName = alterElfNameCharacters(fullName[0], fullName[1]);
    capitalize(fullName[0], fullName[1]);
  }

  // Gnome designated part =================================================================

  ///  /// alters some of the characters of names for gnomes
  List<String> alterGnomeNameCharacters(
      String temporaryName, String temporaryLastName) {
    if (randomChance > 0 && randomChance < 3) {
      temporaryName = temporaryName.replaceFirst('h', "sh");
      temporaryName = temporaryName.replaceAll('h', "ch");
      temporaryLastName = temporaryLastName.replaceFirst('y', "ya");
    } else {
      temporaryName = temporaryName.replaceFirst('h', "ch");
      temporaryName = temporaryName.replaceAll('h', "sh");
      temporaryLastName = temporaryLastName.replaceFirst('y', "yo");
    }
    return [temporaryName, temporaryLastName];
  }

  /// generates names for haflings
  gnomeNameGenerator() {
    var temporaryFullName = generateNameSize(3, 6);
    fullName = alterNameLength(
        7, randomChance, temporaryFullName[0], temporaryFullName[1]);
    fullName = alterGnomeNameCharacters(fullName[0], fullName[1]);
    capitalize(fullName[0], fullName[1]);
  }

// Hafling designated part =================================================================

  ///  /// alters some of the characters of names for haflings
  List<String> alterHaflingNameCharacters(
      String temporaryName, String temporaryLastName) {
    if (randomChance > 0 && randomChance < 3) {
      temporaryName = temporaryName.replaceFirst('w', "f");
      temporaryName = temporaryName.replaceAll('w', "d");
      temporaryLastName = temporaryLastName.replaceFirst('w', "f");
    } else {
      temporaryName = temporaryName.replaceFirst('w', "d");
      temporaryName = temporaryName.replaceAll('w', "f");
      temporaryLastName = temporaryLastName.replaceFirst('w', "d");
    }
    return [temporaryName, temporaryLastName];
  }

  /// generates names for haflings
  haflingNameGenerator() {
    var temporaryFullName = generateNameSize(5, 8);
    fullName = alterNameLength(
        7, randomChance, temporaryFullName[0], temporaryFullName[1]);
    fullName = alterHaflingNameCharacters(fullName[0], fullName[1]);
    capitalize(fullName[0], fullName[1]);
  }

// Human designated part ====================================================================

  humanNameGenerator() {
    if (isMale) {
      var previousName = newName;
      var nameChance = randomIndex.nextInt(humanNames.maleNames.length);
      newName = humanNames.maleNames[nameChance];
      while (newName == previousName) {
        nameChance = randomIndex.nextInt(humanNames.maleNames.length);
        newName = humanNames.maleNames[nameChance];
      }
      notifyListeners();
    }
    if (isFemale) {
      var previousName = newName;
      var nameChance = randomIndex.nextInt(humanNames.femaleNames.length);
      newName = humanNames.femaleNames[nameChance];
      while (newName == previousName) {
        nameChance = randomIndex.nextInt(humanNames.femaleNames.length);
        newName = humanNames.femaleNames[nameChance];
      }
      notifyListeners();
    }
    var previousLastName = newLastName;
    var lastNameChance = randomIndex.nextInt(humanNames.lastNames.length);
    newLastName = humanNames.lastNames[lastNameChance];
    while (newLastName == previousLastName) {
      lastNameChance = randomIndex.nextInt(humanNames.lastNames.length);
      newLastName = humanNames.lastNames[lastNameChance];
      notifyListeners();
    }
  }

// Orc designated part ====================================================================

  /// alters some of the characters of names for orcs
  List<String> alterOrcNameCharacters(
      String temporaryName, String temporaryLastName) {
    if (randomChance > 0 && randomChance < 3) {
      temporaryName = temporaryName.replaceFirst('h', "sh");
      temporaryName = temporaryName.replaceAll('h', "ch");
      temporaryName = temporaryName.replaceFirst('a', "ak");
      temporaryLastName = temporaryLastName.replaceFirst('y', "ya");
      temporaryLastName = temporaryLastName.replaceFirst('a', "ka");
    } else {
      temporaryName = temporaryName.replaceFirst('h', "ch");
      temporaryName = temporaryName.replaceAll('h', "sh");
      temporaryName = temporaryName.replaceFirst('a', "ac");
      temporaryLastName = temporaryLastName.replaceFirst('a', "ca");
      temporaryLastName = temporaryLastName.replaceFirst('y', "yo");
    }
    return [temporaryName, temporaryLastName];
  }

  /// generates names for orcs
  orcNameGenerator() {
    var temporaryFullName = generateNameSize(3, 6);
    fullName = alterNameLength(
        7, randomChance, temporaryFullName[0], temporaryFullName[1]);
    fullName = alterOrcNameCharacters(fullName[0], fullName[1]);
    capitalize(fullName[0], fullName[1]);
  }

// ====================================================================================

  /// calls the respective race name generator
  newNameGenerator() {
    if (chosenRace.name == "Human") {
      humanNameGenerator();
      return;
    }

    if (chosenRace.name == "Orc") {
      orcNameGenerator();
      return;
    }

    if (chosenRace.name == "Elf") {
      elfNameGenerator();
      return;
    }

    if (chosenRace.name == "Hafling") {
      haflingNameGenerator();
      return;
    }
    if (chosenRace.name == "Dwarf") {
      dwarfNameGenerator();
      return;
    }
    if (chosenRace.name == "Gnome") {
      gnomeNameGenerator();
      return;
    }
  }

  /// inverts the name and last name position
  switchNameAndLastName() {
    String switchToName = newName;
    String switchToLastName = newLastName;
    newName = switchToLastName;
    newLastName = switchToName;
    notifyListeners();
  }

  /// saves the displayed name for the saved names page
  saveName(
    BuildContext context,
    Widget noNameMessage,
    Widget alreadySavedmessage,
    Widget savedMessage,
    Color sucessColor,
    Color noNameColor,
    Color alreadySavedColor,
  ) {
    if (newName == " - ? - " || newLastName == " - ? - ") {
      callMessageSnackbar(context, noNameMessage, noNameColor);
      return;
    }
    for (var name in savedNames) {
      if (name.firstName == newName && name.lastName == newLastName) {
        callMessageSnackbar(context, alreadySavedmessage, alreadySavedColor);
        return;
      }
    }
    SavedNameModel nameToSave = SavedNameModel(
        picture: isMale ? chosenRace.malePicture : chosenRace.femalePicture,
        race: chosenRace.name,
        gender: isMale ? 1 : 0,
        firstName: newName,
        lastName: newLastName,
        isSelected: false);
    savedNames.add(nameToSave);
    callMessageSnackbar(context, savedMessage, sucessColor);
  }

  ///Erase name from the list
  deleteName(SavedNameModel name) {
    savedNames.remove(name);
    notifyListeners();
  }
}
