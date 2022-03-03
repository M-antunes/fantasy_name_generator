import 'dart:convert';
import 'dart:math';

import 'package:fantasy_name_generator/models/alignment_model.dart';
import 'package:fantasy_name_generator/models/base_atribute_model.dart';
import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/models/class_model.dart';
import 'package:fantasy_name_generator/models/combat_model.dart';
import 'package:fantasy_name_generator/models/equip_models/equip_model.dart';
import 'package:fantasy_name_generator/models/equip_models/loot_model.dart';
import 'package:fantasy_name_generator/models/key_value.model.dart';
import 'package:fantasy_name_generator/models/letter_model.dart';
import 'package:fantasy_name_generator/models/name_model.dart';
import 'package:fantasy_name_generator/models/resistance_model.dart';
import 'package:fantasy_name_generator/models/saved_name_model.dart';
import 'package:fantasy_name_generator/shared/data/alignment_data.dart';
import 'package:fantasy_name_generator/shared/data/class_data.dart';
import 'package:fantasy_name_generator/shared/widgets/call_message_snackbar.dart';
import 'package:fantasy_name_generator/shared/data/human_names_data.dart';
import 'package:fantasy_name_generator/shared/data/letters_data.dart';
import 'package:fantasy_name_generator/shared/data/race_data.dart';
import 'package:fantasy_name_generator/models/race_model.dart';
import 'package:fantasy_name_generator/shared/widgets/call_undo_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CharController extends ChangeNotifier {
  late RaceModel chosenRace;
  late RaceModel initialRace;
  late ClassModel chosenClass;
  late ClassModel initialClass;
  late AlignmentModel chosenAlignment;
  late AlignmentModel initialAlignment;
  late RaceModel tempRaceForSwitching;
  late ClassModel tempoClassForSwitching;
  late AlignmentModel tempAlignmentForSwitching;
  late CharModel generatedChar;
  var letters = LettersData();
  var listOfRaces = RaceData();
  var listOfClasses = ClassData();
  var listOfAlignments = AlignmentData();
  var humanNames = HumanNamesData();
  var loot = LootModel(items: []);
  Random randomIndex = Random();
  int creationStage = 1;
  int nameLength = 0;
  int randomChance = 0;
  String newName = ' - ? - ';
  String newLastName = ' - ? - ';
  List<SavedNameModel> savedNames = [];
  List<AlignmentModel> filteredAlignments = [];
  List<String> fullName = [];
  bool isMale = true;
  bool isFemale = false;
  bool lastNameShown = true;
  int levelSelected = -1;
  bool isRegularLevelSelected = true;
  bool isEpicLevelSelected = false;

// Functions related to the level Section

  switchToEpicLevel() {
    isRegularLevelSelected = false;
    isEpicLevelSelected = true;
    levelSelected = -1;
    notifyListeners();
  }

  switchToRegularLevel() {
    isRegularLevelSelected = true;
    isEpicLevelSelected = false;
    levelSelected = -1;
    notifyListeners();
  }

  updateLevelSelectedIfEpic() {
    if (isEpicLevelSelected) {
      levelSelected = levelSelected + 20;
    }
    notifyListeners();
  }

  showErrorSnackBarIfLevelIsZero(
      BuildContext context, String text, Color color) {
    if (levelSelected == -1) {
      callMessageSnackbar(context, text, color);
    }
  }

  updateLevelSelected(int? newValue) {
    if (newValue == null) {
      levelSelected = -1;
    } else {
      levelSelected = newValue;
    }
    notifyListeners();
  }

// ====================================================================================

// Functions related to the Character Race

  getInitialRace() {
    initialRace = listOfRaces.races[0];
    chosenRace = initialRace;
    tempRaceForSwitching = chosenRace;
  }

  updateChosenRace() {
    chosenRace = tempRaceForSwitching;
    notifyListeners();
  }

  switchRace(RaceModel race) {
    race.isSelected = !race.isSelected;
    for (var select in listOfRaces.races) {
      select.isSelected = false;
    }
    race.isSelected = !race.isSelected;
    tempRaceForSwitching = race;
    notifyListeners();
  }

// ====================================================================================

// Functions related to the Character Class

  getInitialClass() {
    initialClass = listOfClasses.allClasses[0];
    chosenClass = initialClass;
    tempoClassForSwitching = initialClass;
  }

  updateChosenClass() {
    chosenClass = tempoClassForSwitching;
    notifyListeners();
  }

  switchClass(ClassModel charClass) {
    charClass.isSelected = !charClass.isSelected;
    for (var select in listOfClasses.allClasses) {
      select.isSelected = false;
    }
    charClass.isSelected = !charClass.isSelected;
    tempoClassForSwitching = charClass;
    notifyListeners();
  }
// ====================================================================================

// Functions related to the Character Alignment

  getInitialAlignment() {
    filteredAlignments = listOfAlignments.allAlignments;
    initialAlignment = listOfAlignments.allAlignments[0];
    chosenAlignment = initialAlignment;
  }

  updateChosenAlignment() {
    chosenAlignment = tempAlignmentForSwitching;
    notifyListeners();
  }

  switchAlignment(AlignmentModel alignment) {
    alignment.isSelected = !alignment.isSelected;
    for (var select in filteredAlignments) {
      select.isSelected = false;
    }
    alignment.isSelected = !alignment.isSelected;
    tempAlignmentForSwitching = alignment;
    notifyListeners();
  }

  filterAlignments(String permited1, String permited2, String permited3,
      String permited4, String permited5, String permited6) {
    return listOfAlignments.allAlignments
        .where((type) =>
            type.name == permited1 ||
            type.name == permited2 ||
            type.name == permited3 ||
            type.name == permited4 ||
            type.name == permited5 ||
            type.name == permited6)
        .toList();
  }

  filterAlignmentsToClass() {
    switch (chosenClass.name) {
      case "Barbarian":
        filteredAlignments = filterAlignments("Neutral Good", "Neutral",
            "Neutral Evil", "Chaotic Good", "Chaotic Neutral", "Chaotic Evil");
        notifyListeners();
        break;
      case "Bandit":
        filteredAlignments = filterAlignments("", "Neutral", "Neutral Evil", "",
            "Chaotic Neutral", "Chaotic Evil");
        notifyListeners();
        break;
      case "Cleric":
        filteredAlignments = filterAlignments("Lawful Good", "Lawful Evil",
            "Chaotic Good", "Chaotic Evil", "", "");
        notifyListeners();
        break;
      case "Druid":
        filteredAlignments = filterAlignments(
            "Neutral Good", "Neutral", "Neutral Evil", "", "", "");
        notifyListeners();
        break;
      case "Monk":
        filteredAlignments = filterAlignments(
            "Lawful Good", "Lawful Neutral", "Lawful Evil", "", "", "");
        notifyListeners();
        break;
      case "Paladin":
        filteredAlignments = filterAlignments(
            "Lawful Good", "Lawful Neutral", "Lawful Evil", "", "", "");
        notifyListeners();
        break;
      case "Rogue":
        filteredAlignments = filterAlignments("Neutral Good", "Neutral",
            "Neutral Evil", "Chaotic Good", "Chaotic Neutral", "Chaotic Evil");
        notifyListeners();
        break;
      default:
        filteredAlignments = listOfAlignments.allAlignments;
        notifyListeners();
    }
    for (var i in filteredAlignments) {
      i.isSelected = false;
    }
    tempAlignmentForSwitching = filteredAlignments.first;
    tempAlignmentForSwitching.isSelected = true;
    notifyListeners();
  }

// ====================================================================================

// Functions related to the Character Gender

  switchToMale() {
    isMale = true;
    isFemale = false;
    notifyListeners();
  }

  switchToFemale() {
    isFemale = true;
    isMale = false;
    notifyListeners();
  }
// ====================================================================================

// Physical characteristics based on race and atributes

  /// calculates height for all character
  applyHeight() {
    var char = generatedChar;
    var classGotten = listOfRaces.races
        .firstWhere((element) => element.name == char.charRace.name);
    var baseHeight = classGotten.height!;
    char.charRace.height!.key = baseHeight.key;
    char.charRace.height!.value = baseHeight.value;
    if (generatedChar.charRace.name == "Dwarf" ||
        generatedChar.charRace.name == "Gnome" ||
        generatedChar.charRace.name == "Hafling") {
      var increaseHeight = randomIndex.nextInt(3) + 1;
      char.charRace.height!.value += increaseHeight;
      if (char.charClass.mainAtrb == "Str") {
        char.charRace.height!.value += (increaseHeight / 2).floor();
      }
      transformInchToFoot(char);
      generatedChar.charRace.height!.key = char.charRace.height!.key;
      generatedChar.charRace.height!.value = char.charRace.height!.value;
      notifyListeners();
    } else {
      calculateHeight(char);
    }
  }

  /// changes inches to foot
  transformInchToFoot(CharModel char) {
    if (char.charRace.height!.value > 10) {
      char.charRace.height!.value -= 10;
      char.charRace.height!.key += 1;
    }
  }

  /// calculates heights for medium size characters
  calculateHeight(CharModel char) {
    int baseFeet = char.charRace.height!.key;
    var inchesToAdd = calculateIncreaseInheight(char);
    double extraInches = 0;
    double extraFeet = 0.0;
    for (var i = 0; i < inchesToAdd; i++) {
      extraFeet++;
    }
    extraInches = extraFeet % 10;
    extraFeet /= 10;
    char.modAtributes.constitution! > 3 ? extraInches += 4 : extraInches++;
    char.charRace.height!.key = baseFeet + extraFeet.floor();
    char.charRace.height!.value += extraInches;
    transformInchToFoot(char);
    generatedChar.charRace.height!.key = char.charRace.height!.key;
    generatedChar.charRace.height!.value = char.charRace.height!.value.floor();
    notifyListeners();
  }

  /// calculates the amount of the increment
  int calculateIncreaseInheight(CharModel char) {
    int change = 0;
    int constt = char.baseAtributes.constitution!;
    int str = char.baseAtributes.strength!;
    for (var i = 12; i < constt && i < str; i++) {
      change++;
    }
    return change;
  }

  /// calculates charater's weight
  claculateWeight() {
    var char = generatedChar;
    var classGotten = listOfRaces.races
        .firstWhere((element) => element.name == char.charRace.name);
    var baseWeight = classGotten.weight!.toInt();
    var extraWeight = 0.0;
    if (char.charRace.name == "Dwarf" ||
        char.charRace.name == "Gnome" ||
        char.charRace.name == "Hafling") {
      if (char.charClass.mainAtrb == "Str") {
        extraWeight = randomIndex.nextInt(baseWeight).toDouble();
        extraWeight = extraWeight * 0.4;
      } else {
        extraWeight = randomIndex.nextInt(baseWeight).toDouble();
        extraWeight = extraWeight * 0.2;
      }
    } else {
      if (char.charClass.mainAtrb == "Str") {
        extraWeight = randomIndex.nextInt(baseWeight).toDouble();
        char.modAtributes.constitution! > 3 ? extraWeight += 20 : extraWeight++;
        extraWeight = extraWeight * 0.6;
      } else {
        extraWeight = randomIndex.nextInt(baseWeight).toDouble();
        extraWeight = extraWeight * 0.3;
      }
    }
    var totalWeight = baseWeight + extraWeight;
    generatedChar.charRace.weight = totalWeight;
    notifyListeners();
  }

// ====================================================================================

// Creation Advance and retreat Functions

  advanceCreationStage() {
    creationStage++;
    notifyListeners();
  }

  retreatCreationStage() {
    creationStage--;
    notifyListeners();
  }

//=======================================================================================

// Section to get random letters and syllabus

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

  //=======================================================================================

// Section to generate names

  /// makes the first letter of a name a capital letter
  capitalize(String name, String lastName) {
    String tempName = name[0].toUpperCase() + name.substring(1).toLowerCase();
    String tempLastName =
        lastName[0].toUpperCase() + lastName.substring(1).toLowerCase();
    newName = tempName;
    newLastName = tempLastName;
    notifyListeners();
  }

  displayLastName() {
    lastNameShown = !lastNameShown;
    notifyListeners();
  }

  /// generates name size
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
      if (temporaryLastName.length < 3) {
        temporaryLastName = temporaryLastName + getSyllabus();
      }
    }
    if (temporaryLastName.length > maxLength) {
      temporaryLastName = temporaryLastName.substring(1, (randomChance + 2));
      if (temporaryLastName.length < 3) {
        temporaryLastName = temporaryLastName + getSyllabus();
      }
    }

    return [temporaryName, temporaryLastName];
  }

// Dwarf designated part =================================================================

  /// alters some of the letters of names for dwarfs
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

  /// alters some of the letters of names for elves
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

  ///  /// alters some of the letters of names for gnomes
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

  ///  /// alters some of the letters of names for haflings
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

  /// calls the respective race name generator
  newNameGenerator() {
    switch (chosenRace.name) {
      case "Human":
        humanNameGenerator();
        break;
      case "Half-elf":
        randomChance > 0 && randomChance < 3
            ? elfNameGenerator()
            : humanNameGenerator();
        break;
      case "Orc":
        orcNameGenerator();
        break;
      case "Half-orc":
        randomChance > 0 && randomChance < 3
            ? orcNameGenerator()
            : humanNameGenerator();
        break;
      case "Elf":
        elfNameGenerator();
        break;
      case "Hafling":
        haflingNameGenerator();
        break;
      case "Dwarf":
        dwarfNameGenerator();
        break;
      case "Gnome":
        gnomeNameGenerator();
        break;
      default:
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
    String noNameMessage,
    String alreadySavedmessage,
    String savedMessage,
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
        race: chosenRace,
        gender: isMale ? "Male" : "Female",
        firstName: newName,
        lastName: newLastName,
        fullName: "$newName $newLastName");
    savedNames.insert(0, nameToSave);
    storeName(savedNames);
    callMessageSnackbar(context, savedMessage, sucessColor);
  }

  /// Erase name from the list
  deleteName(
    SavedNameModel name,
    int index,
    BuildContext context,
  ) {
    var deletedName = name;
    savedNames.remove(deletedName);
    notifyListeners();
    deletedNameFromStorage().then((_) {
      updateStorageNameList();
    });
    callUndoButton(context, index, () async {
      savedNames.insert(index, deletedName);
      notifyListeners();
      updateStorageNameList();
      Navigator.pop(context);
    });
  }

  /// Deletes the entire list of names in the storage
  Future<void> deletedNameFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('names');
  }

  /// Updates and brings back the list of names in the storage, with or without the deleted name
  updateStorageNameList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String json = jsonEncode(savedNames);
    prefs.setString("names", json);
  }

  /// Stores the name in SharedPreferences
  storeName(dynamic name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String json = jsonEncode(name);
    prefs.setString("names", json);
  }

  /// Loads the list of stored names when the application starts
  loadStoredNames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String json = prefs.getString('names') ?? '';
    Iterable<dynamic> response = jsonDecode(json);
    List<SavedNameModel> chosenNames =
        response.map((e) => SavedNameModel.fromJson(e)).toList();
    savedNames = chosenNames;
    notifyListeners();
  }

// ======================================================================================

  updateCharModel() {
    generatedChar = CharModel(
        charRace: chosenRace.copyWith(
          height: KeyValueModel(key: 0, value: 0),
          weight: 0,
          age: 0,
          speed: 0,
        ),
        charName: NameModel(
            gender: isMale ? "Male" : "Female",
            name: newName,
            surname: newLastName,
            fullName: "$newName  $newLastName"),
        alignment: chosenAlignment,
        combatStats: CombatModel(),
        charClass: chosenClass,
        baseAtributes: AtributeModel(),
        modAtributes: AtributeModel(),
        charEquip: EquipModel(),
        hitPoints: 0,
        resistances: ResistanceModel(),
        loot: loot,
        charLevel: levelSelected + 1);
    notifyListeners();
  }

//=======================================================================================

// Section for generation Status

  sortAtributesToClass(int v0, int v1, int v2, int v3, int v4, int v5) {
    generatedChar.baseAtributes.strength = v0;
    generatedChar.baseAtributes.dexterity = v1;
    generatedChar.baseAtributes.constitution = v2;
    generatedChar.baseAtributes.intelligence = v3;
    generatedChar.baseAtributes.wisdom = v4;
    generatedChar.baseAtributes.charisma = v5;
    notifyListeners();
  }

  generateAllAtributs() {
    List<int> atrbValues = [];
    for (var i = 0; i < 6; i++) {
      var atrbValue = randomIndex.nextInt(19);
      while (atrbValue < 7) {
        atrbValue = randomIndex.nextInt(19);
      }
      atrbValues.add(atrbValue);
    }
    atrbValues.sort((b, a) => a.compareTo(b));

    switch (generatedChar.charClass.name) {
      case "Barbarian":
        sortAtributesToClass(atrbValues[0], atrbValues[2], atrbValues[1],
            atrbValues[4], atrbValues[3], atrbValues[5]);
        break;
      case "Warrior":
        sortAtributesToClass(atrbValues[0], atrbValues[2], atrbValues[1],
            atrbValues[4], atrbValues[3], atrbValues[5]);
        break;
      case "Alchemist":
        sortAtributesToClass(atrbValues[5], atrbValues[3], atrbValues[2],
            atrbValues[0], atrbValues[1], atrbValues[4]);
        break;
      case "Wizard":
        sortAtributesToClass(atrbValues[5], atrbValues[3], atrbValues[2],
            atrbValues[0], atrbValues[1], atrbValues[4]);
        break;
      case "Cleric":
        sortAtributesToClass(atrbValues[2], atrbValues[3], atrbValues[1],
            atrbValues[4], atrbValues[0], atrbValues[5]);
        break;
      case "Druid":
        sortAtributesToClass(atrbValues[2], atrbValues[3], atrbValues[1],
            atrbValues[5], atrbValues[0], atrbValues[4]);
        break;
      case "Rogue":
        sortAtributesToClass(atrbValues[3], atrbValues[0], atrbValues[5],
            atrbValues[2], atrbValues[4], atrbValues[1]);
        break;
      case "Ranger":
        sortAtributesToClass(atrbValues[1], atrbValues[0], atrbValues[3],
            atrbValues[5], atrbValues[2], atrbValues[4]);
        break;
      case "Paladin":
        sortAtributesToClass(atrbValues[0], atrbValues[4], atrbValues[2],
            atrbValues[5], atrbValues[3], atrbValues[1]);
        break;
      case "Bard":
        sortAtributesToClass(atrbValues[5], atrbValues[3], atrbValues[4],
            atrbValues[2], atrbValues[1], atrbValues[0]);
        break;
      case "Sorcerer":
        sortAtributesToClass(atrbValues[5], atrbValues[4], atrbValues[2],
            atrbValues[3], atrbValues[1], atrbValues[0]);
        break;
      case "Monk":
        sortAtributesToClass(atrbValues[2], atrbValues[0], atrbValues[3],
            atrbValues[4], atrbValues[1], atrbValues[5]);
        break;
      case "Noble":
        sortAtributesToClass(atrbValues[4], atrbValues[4], atrbValues[4],
            atrbValues[2], atrbValues[2], atrbValues[1]);
        break;
      case "Aristocrat":
        sortAtributesToClass(atrbValues[4], atrbValues[4], atrbValues[4],
            atrbValues[0], atrbValues[1], atrbValues[3]);
        break;
      case "Bandit":
        sortAtributesToClass(atrbValues[0], atrbValues[1], atrbValues[2],
            atrbValues[5], atrbValues[3], atrbValues[4]);
        break;
      default:
        sortAtributesToClass(atrbValues[3], atrbValues[3], atrbValues[3],
            atrbValues[3], atrbValues[3], atrbValues[3]);
    }
    applyHeight();
    ajustStatsToLevel();
    calculateAllModifiers();
    generateHitPoints();
  }

  ClassModel? findIfClassIsPhysicalOrMental(
      List<ClassModel> mentalChars, List<ClassModel> physicalChars) {
    ClassModel classGotten = initialClass;
    for (var i in mentalChars) {
      if (generatedChar.charClass.name == i.name) {
        classGotten = i;
      }
    }
    for (var i in physicalChars) {
      if (generatedChar.charClass.name == i.name) {
        classGotten = i;
      }
    }
    return classGotten;
  }

  ajustStatsToLevel() {
    var race = generatedChar.charRace;
    var physicalChars = listOfClasses.physicalClasses;
    var mentalChars = listOfClasses.mentalClasses;
    int level = levelSelected + 1;
    int mainAtributeIncrement = 0;
    ClassModel? classGotten =
        findIfClassIsPhysicalOrMental(mentalChars, physicalChars);
    double secondaryAtributeIncrement = 0.0;
    ajustStatsToRace(race, classGotten!);
    var atrbValues = generatedChar.baseAtributes;
    if (physicalChars.contains(classGotten)) {
      for (var i = 0; i < level; i = i + 4) {
        mainAtributeIncrement++;
        secondaryAtributeIncrement = secondaryAtributeIncrement + 0.5;
      }
      generatedChar.baseAtributes.strength =
          atrbValues.strength! + mainAtributeIncrement;
      generatedChar.baseAtributes.dexterity =
          atrbValues.dexterity! + mainAtributeIncrement;
      generatedChar.baseAtributes.constitution =
          atrbValues.constitution! + mainAtributeIncrement;
      generatedChar.baseAtributes.intelligence =
          atrbValues.intelligence! + secondaryAtributeIncrement.floor();
      generatedChar.baseAtributes.wisdom =
          atrbValues.wisdom! + secondaryAtributeIncrement.floor();
      generatedChar.baseAtributes.charisma =
          atrbValues.charisma! + secondaryAtributeIncrement.floor();
    }
    if (mentalChars.contains(classGotten)) {
      for (var i = 0; i < level; i = i + 3) {
        mainAtributeIncrement++;
        secondaryAtributeIncrement = secondaryAtributeIncrement + 0.5;
      }
      generatedChar.baseAtributes.strength =
          atrbValues.strength! + secondaryAtributeIncrement.floor();
      generatedChar.baseAtributes.dexterity =
          atrbValues.dexterity! + secondaryAtributeIncrement.floor();
      generatedChar.baseAtributes.constitution =
          atrbValues.constitution! + secondaryAtributeIncrement.floor();
      generatedChar.baseAtributes.intelligence =
          atrbValues.intelligence! + mainAtributeIncrement;
      generatedChar.baseAtributes.wisdom =
          atrbValues.wisdom! + mainAtributeIncrement;
      generatedChar.baseAtributes.charisma =
          atrbValues.charisma! + mainAtributeIncrement;
    }
    notifyListeners();
  }

  calculateAllModifiers() {
    var atributes = generatedChar.baseAtributes;
    generatedChar.modAtributes.strength =
        calculateModifier(atributes.strength!, atributes.strength!);
    generatedChar.modAtributes.dexterity =
        calculateModifier(atributes.dexterity!, atributes.dexterity!);
    generatedChar.modAtributes.constitution =
        calculateModifier(atributes.constitution!, atributes.constitution!);
    generatedChar.modAtributes.intelligence =
        calculateModifier(atributes.intelligence!, atributes.intelligence!);
    generatedChar.modAtributes.wisdom =
        calculateModifier(atributes.wisdom!, atributes.wisdom!);
    generatedChar.modAtributes.charisma =
        calculateModifier(atributes.charisma!, atributes.charisma!);
    notifyListeners();
  }

  int calculateModifier(int value, int baseValue) {
    double doubleValue = value.toDouble();
    doubleValue = (doubleValue - 10) / 2;
    if (baseValue <= 9 && baseValue >= 8) {
      doubleValue = -1;
    }
    if (baseValue <= 7 && baseValue >= 6) {
      doubleValue = -2;
    }
    return doubleValue.toInt();
  }

  ajustStatsToRace(RaceModel race, ClassModel klass) {
    if (race.name == "Human" ||
        race.name == "Half-elf" ||
        race.name == "Half-orc") {
      switch (klass.mainAtrb) {
        case "Str":
          calculateAjustToRace(2, 0, 0, 0, 0, 0);
          break;
        case "Dex":
          calculateAjustToRace(0, 2, 0, 0, 0, 0);
          break;
        case "Int":
          calculateAjustToRace(0, 0, 0, 2, 0, 0);
          break;
        case "Wis":
          calculateAjustToRace(0, 0, 0, 0, 2, 0);
          break;
        case "Cha":
          calculateAjustToRace(0, 0, 0, 0, 0, 2);
          break;
        default:
      }
    }
    switch (race.name) {
      case "Orc":
        calculateAjustToRace(4, 0, 2, -2, -2, -2);
        break;
      case "Elf":
        calculateAjustToRace(0, 2, -2, 2, 0, 0);
        break;
      case "Dwarf":
        calculateAjustToRace(0, 0, 2, 0, 2, -2);
        break;
      case "Gnome":
        calculateAjustToRace(-2, 0, 2, 0, 0, 2);
        break;
      case "Hafling":
        calculateAjustToRace(-2, 2, 0, 0, 0, 2);
        break;
      default:
    }
    claculateWeight();
  }

  calculateAjustToRace(
    int adjutStr,
    int ajustDex,
    int ajustCon,
    int adjustInt,
    int ajustWis,
    int ajustCha,
  ) {
    var ajustedAtrb = generatedChar.baseAtributes;
    generatedChar.baseAtributes.strength = ajustedAtrb.strength! + adjutStr;
    generatedChar.baseAtributes.dexterity = ajustedAtrb.dexterity! + ajustDex;
    generatedChar.baseAtributes.constitution =
        ajustedAtrb.constitution! + ajustCon;
    generatedChar.baseAtributes.intelligence =
        ajustedAtrb.intelligence! + adjustInt;
    generatedChar.baseAtributes.wisdom = ajustedAtrb.wisdom! + ajustWis;
    generatedChar.baseAtributes.charisma = ajustedAtrb.charisma! + ajustCha;
    notifyListeners();
  }

//=======================================================================================

// section for hit points generation

  generateHitPoints() {
    var changeCharInfo = generatedChar;
    var hitPoints =
        changeCharInfo.charLevel * changeCharInfo.modAtributes.constitution!;
    var diceHitPoints = calculateHipPointsDicePerClass();
    hitPoints = hitPoints + diceHitPoints;
    generatedChar.hitPoints = hitPoints;
    notifyListeners();
  }

  int rollingDice(int dice) {
    var randomRoll = randomIndex.nextInt(dice);
    while (randomRoll < 1) {
      randomRoll = randomIndex.nextInt(dice);
    }
    return randomRoll;
  }

  int calculateHipPointsDicePerClass() {
    var dice = generatedChar.charClass.hitDice;
    var rollTimes = generatedChar.charLevel - 1;
    var hitpoints = dice;
    for (var i = 0; i < rollTimes; i++) {
      hitpoints = hitpoints! + rollingDice(dice!);
    }
    return hitpoints!;
  }

//=======================================================================================

// section to generate Ac defense

  claculatingHitDefense() {
    var char = generatedChar;
    int armorAc = 0;
    int touch = 0;
    int surprise = 0;
    armorAc = 10 + char.modAtributes.dexterity!;
    touch = 10 + char.modAtributes.dexterity!;
    surprise = 10;
    if (chosenRace.name == "Hafling" || chosenRace.name == "Gnome") {
      armorAc++;
      touch++;
    }
    generatedChar.combatStats.armourClass = armorAc;
    generatedChar.combatStats.armourTouch = touch;
    generatedChar.combatStats.armourSurprise = surprise;
    notifyListeners();
  }

  calculateResistances() {
    var char = generatedChar;
    int partialFort = 0;
    int partialRef = 0;
    int partialWill = 0;
    int level = char.charLevel;
    var bonusAtLevel = listOfClasses.goodOrBad[level - 1];
    switch (char.charClass.resistUpgrade) {
      case "fort":
        partialFort = bonusAtLevel.good;
        partialRef = bonusAtLevel.bad;
        partialWill = bonusAtLevel.bad;
        break;
      case "ref":
        partialFort = bonusAtLevel.bad;
        partialRef = bonusAtLevel.good;
        partialWill = bonusAtLevel.bad;
        break;
      case "will":
        partialFort = bonusAtLevel.bad;
        partialRef = bonusAtLevel.bad;
        partialWill = bonusAtLevel.good;
        break;
      case "fort, will":
        partialFort = bonusAtLevel.good;
        partialRef = bonusAtLevel.bad;
        partialWill = bonusAtLevel.good;
        break;
      case "fort, ref":
        partialFort = bonusAtLevel.good;
        partialRef = bonusAtLevel.good;
        partialWill = bonusAtLevel.bad;
        break;
      case "ref, will":
        partialFort = bonusAtLevel.bad;
        partialRef = bonusAtLevel.good;
        partialWill = bonusAtLevel.good;
        break;
      case "all":
        partialFort = bonusAtLevel.good;
        partialRef = bonusAtLevel.good;
        partialWill = bonusAtLevel.good;
        break;
      default:
    }
    char.resistances.fortitude = partialFort + char.modAtributes.constitution!;
    char.resistances.reflex = partialRef + char.modAtributes.dexterity!;
    char.resistances.will = partialWill + char.modAtributes.wisdom!;

    generatedChar.resistances = char.resistances;
    notifyListeners();
  }

//=======================================================================================
  // Section for Equipment of the character

  generateRandomWeapon() {
    var randomInt = randomIndex.nextInt(10);
  }
}
