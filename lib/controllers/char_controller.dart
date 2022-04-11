import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:fantasy_name_generator/models/alignment_model.dart';
import 'package:fantasy_name_generator/models/base_atribute_model.dart';
import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/models/class_model.dart';
import 'package:fantasy_name_generator/models/combat_model.dart';
import 'package:fantasy_name_generator/models/combat_style_choice_model.dart';
import 'package:fantasy_name_generator/models/equip_models/equip_model.dart';
import 'package:fantasy_name_generator/models/equip_models/loot_model.dart';
import 'package:fantasy_name_generator/models/key_value.model.dart';
import 'package:fantasy_name_generator/models/letter_model.dart';
import 'package:fantasy_name_generator/models/name_model.dart';
import 'package:fantasy_name_generator/models/physical_style_model.dart';
import 'package:fantasy_name_generator/models/resistance_model.dart';
import 'package:fantasy_name_generator/models/saved_name_model.dart';
import 'package:fantasy_name_generator/shared/data/alignment_data.dart';
import 'package:fantasy_name_generator/shared/data/class_data.dart';
import 'package:fantasy_name_generator/shared/data/equip_data.dart';
import 'package:fantasy_name_generator/shared/widgets/call_message_snackbar.dart';
import 'package:fantasy_name_generator/shared/data/human_names_data.dart';
import 'package:fantasy_name_generator/shared/data/letters_data.dart';
import 'package:fantasy_name_generator/shared/data/race_data.dart';
import 'package:fantasy_name_generator/models/race_model.dart';
import 'package:fantasy_name_generator/shared/widgets/call_undo_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/utils/utils.dart';

class CharController extends ChangeNotifier {
  late RaceModel chosenRace;
  late ClassModel chosenClass;
  late AlignmentModel chosenAlignment;
  late RaceModel tempRaceForSwitching;
  late ClassModel tempClassForSwitching;
  late AlignmentModel tempAlignmentForSwitching;
  late CombatStyleChoiceModel tempStyleForSwitching;
  late CombatStyleChoiceModel chosenStyle;
  late PhysicalStyleModel physicalStyleChoice;
  late CharModel cha;
  var letters = LettersData();
  var listOfRaces = RaceData();
  var listOfClasses = ClassData();
  var listOfAlignments = AlignmentData();
  var listOfEquip = EquipData();
  var humanNames = HumanNamesData();
  Random randomIndex = Random();
  int creationStage = 1;
  int nameLength = 0;
  int randomChance = 0;
  String newName = ' - ? - ';
  String newLastName = ' - ? - ';
  List<SavedNameModel> savedNames = [];
  List<AlignmentModel> filteredAlignments = [];
  List<ClassModel> filteredClasses = [];
  List<String> fullName = [];
  List<String> tempFullName = [];
  bool isMale = true;
  bool isFemale = false;
  bool lastNameShown = true;
  int levelSelected = -1;
  bool isRegularLevelSelected = true;
  bool isEpicLevelSelected = false;
  bool isLegendaryLevelSelected = false;

// Functions related to the level Section

  switchToEpicLevel() {
    isRegularLevelSelected = false;
    isLegendaryLevelSelected = false;
    isEpicLevelSelected = true;
    levelSelected = -1;
    notifyListeners();
  }

  switchToLegendary() {
    isRegularLevelSelected = false;
    isLegendaryLevelSelected = true;
    isEpicLevelSelected = false;
    levelSelected = -1;
    notifyListeners();
  }

  switchToRegularLevel() {
    isRegularLevelSelected = true;
    isEpicLevelSelected = false;
    isLegendaryLevelSelected = false;
    levelSelected = -1;
    notifyListeners();
  }

  updateLevelSelectedIfEpic() {
    if (isEpicLevelSelected) {
      levelSelected = levelSelected + 20;
    }
    notifyListeners();
  }

  updateLevelSelectedIfLegendary() {
    if (isLegendaryLevelSelected) {
      levelSelected = levelSelected + 25;
    }
    notifyListeners();
  }

  showErrorSnackBarIfLevelIsZero(
      BuildContext context, String text, Color color) {
    if (levelSelected == -1) {
      callMessageSnackbar(context, text, color, null);
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

  resetLevel() {
    levelSelected = -1;
    isEpicLevelSelected = false;
    isLegendaryLevelSelected = false;
    notifyListeners();
  }

// ====================================================================================

// Functions related to the Character Race

  starttempRace() {
    tempRaceForSwitching = listOfRaces.races[0];
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
    newName = ' - ? - ';
    newLastName = ' - ? - ';
    notifyListeners();
  }

// ====================================================================================

// Functions related to the combat style choice

  getInitialCombatStyle() {
    tempStyleForSwitching = listOfClasses.combatStyles[0];
  }

  updateChosenCombatStyle() {
    chosenStyle = tempStyleForSwitching;
    notifyListeners();
  }

  switchCombatStyle(CombatStyleChoiceModel style) {
    for (var select in listOfClasses.combatStyles) {
      select.isSelected = false;
    }
    style.isSelected = !style.isSelected;
    tempStyleForSwitching = style;
    notifyListeners();
  }

  switchPhysicalStyle(PhysicalStyleModel style) {
    for (var select in listOfClasses.physicalStyles) {
      select.isSelected = false;
    }
    style.isSelected = !style.isSelected;
    physicalStyleChoice = style;
    notifyListeners();
  }

// ====================================================================================

// Functions related to the Character Class

  filterClasses() {
    filteredClasses = listOfClasses.allClasses
        .where((element) => element.combatStyle == chosenStyle.name)
        .toList();
    for (var i in filteredClasses) {
      i.isSelected = false;
    }
    tempClassForSwitching = filteredClasses.first;
    tempClassForSwitching.isSelected = true;
    notifyListeners();
  }

  startTempClass() {
    tempClassForSwitching = listOfClasses.allClasses[0];
  }

  updateChosenClass() {
    chosenClass = tempClassForSwitching;
    notifyListeners();
  }

  switchClass(ClassModel charClass) {
    for (var select in listOfClasses.allClasses) {
      select.isSelected = false;
    }
    charClass.isSelected = !charClass.isSelected;
    tempClassForSwitching = charClass;
    notifyListeners();
  }
// ====================================================================================

// Functions related to the Character Alignment

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

  filterAlignmentsToClass() {
    filteredAlignments.clear();
    for (var i = 0; i < chosenClass.permittedAligments.length; i++) {
      filteredAlignments.addAll(listOfAlignments.allAlignments
          .where((element) => element.name == chosenClass.permittedAligments[i])
          .toList());
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
// ====================================================================================

// Physical characteristics based on race and atributes

  /// calculates height and weight for all character
  applyHeightAndWeight() {
    var char = cha;
    var increment = 0;
    var raceGotten = listOfRaces.races
        .firstWhere((element) => element.name == char.charRace.name);
    int baseInches = raceGotten.height!.value;
    int baseFeet = raceGotten.height!.key;
    var baseWeight = raceGotten.weight!;
    if (raceGotten.name == "Dwarf" || raceGotten.size == "Small") {
      increment = rollingDice(4) + rollingDice(4);
      baseInches += increment;
      if (raceGotten.name == "Dwarf") {
        baseWeight += (increment * 7);
      } else {
        baseWeight += (increment * 1.5);
      }
    } else if (raceGotten.name == "Half-elf" || raceGotten.name == "Elf") {
      increment = rollingDice(8) + rollingDice(8);
      baseInches += increment;
      baseWeight += (increment * 7);
    } else if (raceGotten.name == "Half-orc" || raceGotten.name == "Human") {
      increment = rollingDice(10) + rollingDice(10);
      baseInches += increment;
      baseWeight += (increment * 7);
    } else {
      increment = rollingDice(12) + rollingDice(12);
      baseInches += increment;
      baseWeight += (increment * 9);
    }
    if (char.charClass.mainAtrb == "Str" && char.charRace.size != "Small") {
      baseInches += rollingDice(4);
      baseWeight += rollingDice(20) + rollingDice(20);
    }
    char.charRace.height!.value = baseInches;
    char.charRace.height!.key = baseFeet;
    char.charRace.weight = baseWeight;
    transformInchToFoot(char);
    cha.charRace.height!.value = char.charRace.height!.value;
    cha.charRace.height!.key = char.charRace.height!.key;
    cha.charRace.weight = char.charRace.weight;
    notifyListeners();
  }

  /// changes inches to foot
  transformInchToFoot(CharModel char) {
    if (char.charRace.height!.value > 10) {
      while (char.charRace.height!.value > 10) {
        char.charRace.height!.value -= 10;
        char.charRace.height!.key += 1;
      }
    }
  }

  int ajustAgeAccordingtoRace(
      CharModel char, int physClassDif, int mentClassDif) {
    double baseAge = 0;
    var ageIncrement = 0;
    int dif = 0;
    bool containsPhys = listOfClasses.allClasses
        .any((element) => element.combatStyle == "Physical");
    if (containsPhys) {
      if (char.charClass.name == "Barbarian" ||
          char.charClass.name == "Rogue") {
        double youngClassDif = physClassDif * 0.6;
        dif = youngClassDif.toInt();
        ageIncrement = randomIndex.nextInt(dif);
        baseAge = baseAge + ageIncrement;
      } else {
        ageIncrement = randomIndex.nextInt(physClassDif);
        baseAge = baseAge + ageIncrement;
      }
    }
    bool containsMent = listOfClasses.allClasses.any((element) =>
        element.combatStyle == "Hybrid" || element.combatStyle == "Spellcater");
    if (containsMent) {
      ageIncrement = randomIndex.nextInt(mentClassDif);
      baseAge = baseAge + ageIncrement;
    }
    if (char.charLevel > 4) {
      for (var i = 4; i < char.charLevel; i = i + 4) {
        baseAge = baseAge + 1.5;
      }
    }
    return baseAge.toInt();
  }

  ///calculate character's Age
  claculateAge() {
    var character = cha;
    var raceGotten = listOfRaces.races
        .firstWhere((element) => element.name == character.charRace.name);
    var baseAge = raceGotten.age;
    var tempRaceAge = 0;
    switch (character.charRace.name) {
      case "Dwarf":
        tempRaceAge = ajustAgeAccordingtoRace(character, 30, 60);
        break;
      case "Elf":
        tempRaceAge = ajustAgeAccordingtoRace(character, 30, 60);
        break;
      case "Gnome":
        tempRaceAge = ajustAgeAccordingtoRace(character, 20, 40);
        break;
      case "Hafling":
        tempRaceAge = ajustAgeAccordingtoRace(character, 10, 20);
        break;
      case "Half-elf":
        tempRaceAge = ajustAgeAccordingtoRace(character, 10, 20);
        break;
      case "Half-orc":
        tempRaceAge = ajustAgeAccordingtoRace(character, 7, 14);
        break;
      case "Human":
        tempRaceAge = ajustAgeAccordingtoRace(character, 8, 16);
        break;
      case "Orc":
        tempRaceAge = ajustAgeAccordingtoRace(character, 4, 12);
        break;
      default:
    }
    cha.charRace.age = baseAge! + tempRaceAge;
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
    for (var i = 0; i < desiredLength; i++) {
      List<dynamic> letterPicker = [
        getAllLetters(letters.alphabet, "vowel"),
        getAllLetters(letters.syllabus, "twoLetterSyllabus"),
        getAllLetters(letters.syllabus, "threeLetterSyllabus"),
        getAllLetters(letters.syllabus, "fourLetterSyllabus"),
      ];
      letterPicker.shuffle();
      var changableIndexName = randomIndex.nextInt(4);
      var changableIndexLastName = randomIndex.nextInt(4);
      while (changableIndexName == changableIndexLastName) {
        changableIndexLastName = randomIndex.nextInt(4);
      }
      temporaryName = temporaryName + letterPicker[changableIndexName];
      temporaryLastName =
          temporaryLastName + letterPicker[changableIndexLastName];
    }
    temporaryFullName = [temporaryName, temporaryLastName];
    return temporaryFullName;
  }

  ///Gets all letters according to parameters
  getAllLetters(List<LetterModel> letterKind, String type) {
    List<LetterModel> list = [];
    for (var n in letterKind) {
      if (n.type == type) {
        list.add(n);
      }
    }
    var chance = randomIndex.nextInt(list.length);
    return list[chance].value;
  }

  /// alter names according to the common race name length
  List<String> alterNameLength(int maxLength, int randomChance,
      String temporaryName, String temporaryLastName) {
    if (temporaryName.length == 3) {
      chosenRace.name == "Elf" ||
              chosenRace.name == "Hafling" ||
              chosenRace.name == "Gnome"
          ? temporaryName = temporaryName +
              getAllLetters(letters.syllabus, "twoLetterSyllabus")
          : temporaryName = temporaryName;
    }
    if (temporaryName.length <= 2) {
      chosenRace.name == "Elf" || chosenRace.name == "Hafling"
          ? temporaryName = temporaryName +
              getAllLetters(letters.syllabus, "twoLetterSyllabus") +
              getAllLetters(letters.alphabet, "vowel") +
              getAllLetters(letters.syllabus, "fourLetterSyllabus")
          : temporaryName = temporaryName +
              getAllLetters(letters.syllabus, "fourLetterSyllabus");
    }
    if (temporaryLastName.length < 3) {
      temporaryLastName = temporaryLastName +
          getAllLetters(letters.syllabus, "fourLetterSyllabus");
    }
    if (temporaryName.length > maxLength) {
      temporaryName = temporaryName.substring(1, maxLength);
    }
    if (temporaryLastName.length > maxLength) {
      temporaryLastName = temporaryLastName.substring(1, maxLength);
    }
    return [temporaryName, temporaryLastName];
  }

  /// generates all names according to race and length
  generalNameGenerator(int desiredLength, int maxLength) {
    var temporaryFullName = generateNameSize(desiredLength, desiredLength);
    tempFullName = alterNameLength(
        maxLength, randomChance, temporaryFullName[0], temporaryFullName[1]);
    notifyListeners();
  }

  String stoppingTripleAndQuadripleLetters(String name) {
    List<String> nameToList = name.split('');
    var consonants = letters.alphabet
        .where((element) => element.type == "consonant")
        .toList();
    var vowels =
        letters.alphabet.where((element) => element.type == "vowel").toList();
    consonants.shuffle();
    var consonantChance = randomIndex.nextInt(20) + 1;
    var randomConsonant = consonants.elementAt(consonantChance);
    var consonantChance2 = randomIndex.nextInt(20) + 1;
    var randomConsonant2 = consonants.elementAt(consonantChance2);
    var listToCompare = [];
    List<int> listOfIndexes = [];
    var index = 0;
    var count = 0;
    for (var i in nameToList) {
      if (vowels.any((element) => element.value == i)) {
        if (listToCompare.contains(i) &&
            listToCompare.length > listOfIndexes.length) {
          listOfIndexes.add(count);
        } else if (listToCompare.length > listOfIndexes.length) {
          listOfIndexes.add(count);
        } else {
          listOfIndexes.add(index);
          index++;
        }
      }
      count++;
      listToCompare.add(i);
    }
    var indexes = listOfIndexes.join();
    if (indexes.contains("0123")) {
      replaceTwoExtraLetter(
          nameToList, randomConsonant.value, randomConsonant2.value, 1, 3);
      return name = nameToList.join();
    } else if (indexes.contains("1234")) {
      replaceTwoExtraLetter(
          nameToList, randomConsonant.value, randomConsonant2.value, 2, 4);
      return name = nameToList.join();
    } else if (indexes.contains("2345")) {
      replaceTwoExtraLetter(
          nameToList, randomConsonant.value, randomConsonant2.value, 3, 5);
      return name = nameToList.join();
    } else if (indexes.contains("3456")) {
      replaceTwoExtraLetter(
          nameToList, randomConsonant.value, randomConsonant2.value, 4, 6);
      return name = nameToList.join();
    } else if (indexes.contains("4567")) {
      replaceTwoExtraLetter(
          nameToList, randomConsonant.value, randomConsonant2.value, 5, 7);
      return name = nameToList.join();
    } else if (indexes.contains("5678")) {
      replaceTwoExtraLetter(
          nameToList, randomConsonant.value, randomConsonant2.value, 6, 8);
      return name = nameToList.join();
    } else if (indexes.contains("012")) {
      replaceExtraLetter(nameToList, randomConsonant.value, 1);
      return name = nameToList.join();
    } else if (indexes.contains("123")) {
      replaceExtraLetter(nameToList, randomConsonant.value, 2);
      return name = nameToList.join();
    } else if (indexes.contains("234")) {
      replaceExtraLetter(nameToList, randomConsonant.value, 3);
      return name = nameToList.join();
    } else if (indexes.contains("345")) {
      replaceExtraLetter(nameToList, randomConsonant.value, 4);
      return name = nameToList.join();
    } else if (indexes.contains("456")) {
      replaceExtraLetter(nameToList, randomConsonant.value, 5);
      return name = nameToList.join();
    } else if (indexes.contains("567")) {
      replaceExtraLetter(nameToList, randomConsonant.value, 6);
      return name = nameToList.join();
    } else if (indexes.contains("678")) {
      replaceExtraLetter(nameToList, randomConsonant.value, 7);
      return name = nameToList.join();
    }
    return name;
  }

  replaceTwoExtraLetter(List<String> name, String consonant, String consonant2,
      int index, int index2) {
    var replaceLetter = consonant;
    var replaceLetter2 = consonant2;
    name.removeAt(index);
    name.insert(index, replaceLetter);
    name.removeAt(index2);
    name.insert(index2, replaceLetter2);
  }

  replaceExtraLetter(List<String> name, String consonant, int index) {
    var replaceLetter = consonant;
    name.removeAt(index);
    name.insert(index, replaceLetter);
  }

  String stoppingUnlikelyDoubleLetters(String name) {
    name = name.replaceFirst("rl", "r");
    name = name.replaceFirst("cm", "o");
    name = name.replaceFirst("fp", "phy");
    name = name.replaceFirst("vm", "va");
    name = name.replaceFirst("mv", "me");
    name = name.replaceFirst("xv", "pe");
    name = name.replaceFirst("vx", "la");
    name = name.replaceFirst("mr", "my");
    name = name.replaceFirst("nr", "ce");
    name = name.replaceFirst("rm", "ba");
    name = name.replaceFirst("jl", "al");
    name = name.replaceFirst("jg", "ja");
    return name;
  }

  String changeLastLettersAcordingToGender(
      String temporaryName,
      String letter1,
      String letter2,
      String letter3,
      String replace1,
      String replace2,
      String replace3) {
    if (temporaryName.endsWith(letter1) ||
        temporaryName.endsWith(letter2) ||
        temporaryName.endsWith(letter3)) {
      randomChance < 3
          ? temporaryName = temporaryName + replace1
          : randomChance < 5
              ? temporaryName = temporaryName + replace2
              : temporaryName = temporaryName + replace3;
    }
    return temporaryName;
  }

// Dwarf designated part =================================================================

  /// alters some of the letters of names for dwarfs
  List<String> alterDwarfNameCharacters(
      String temporaryName, String temporaryLastName) {
    if (randomChance < 3) {
      temporaryName = temporaryName.replaceFirst('h', "sh");
      temporaryName = temporaryName.replaceAll('q', "qa");
      temporaryLastName = temporaryLastName.replaceFirst('y', "ya");
      temporaryLastName = temporaryLastName.replaceFirst('q', "qa");
    } else {
      temporaryName = temporaryName.replaceFirst('h', "ch");
      temporaryName = temporaryName.replaceAll('q', "qo");
      temporaryLastName = temporaryLastName.replaceFirst('q', "qy");
    }
    temporaryName = stoppingUnlikelyDoubleLetters(temporaryName);
    temporaryLastName = stoppingUnlikelyDoubleLetters(temporaryLastName);
    temporaryName = stoppingTripleAndQuadripleLetters(temporaryName);
    temporaryLastName = stoppingTripleAndQuadripleLetters(temporaryLastName);
    if (isMale) {
      temporaryName = changeLastLettersAcordingToGender(
          temporaryName, "a", "e", "i", "ng", "z", "ck");
    } else {
      temporaryName = changeLastLettersAcordingToGender(
          temporaryName, "o", "r", "k", "ila", "yen", "es");
    }
    return [temporaryName, temporaryLastName];
  }

  /// generates names for dwarf
  dwarfNameGenerator() {
    generalNameGenerator(2, 6);
    fullName = alterDwarfNameCharacters(tempFullName[0], tempFullName[1]);
  }

// Elf designated part ======================================================================

  /// alters some of the letters of names for elves
  List<String> alterElfNameCharacters(
      String temporaryName, String temporaryLastName) {
    if (randomChance < 4) {
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
    temporaryName = stoppingUnlikelyDoubleLetters(temporaryName);
    temporaryLastName = stoppingUnlikelyDoubleLetters(temporaryLastName);
    temporaryName = stoppingTripleAndQuadripleLetters(temporaryName);
    temporaryLastName = stoppingTripleAndQuadripleLetters(temporaryLastName);
    if (isMale) {
      temporaryName = changeLastLettersAcordingToGender(
          temporaryName, "a", "e", "i", "l", "s", "n");
    } else {
      temporaryName = changeLastLettersAcordingToGender(
          temporaryName, "o", "u", "i", "la", "nes", "pa");
    }
    return [temporaryName, temporaryLastName];
  }

  /// generates names for elves
  elfNameGenerator() {
    generalNameGenerator(3, 7);
    fullName = alterElfNameCharacters(tempFullName[0], tempFullName[1]);
  }

  // Gnome designated part =================================================================

  ///  /// alters some of the letters of names for gnomes
  List<String> alterGnomeNameCharacters(
      String temporaryName, String temporaryLastName) {
    if (randomChance < 3) {
      temporaryName = temporaryName.replaceFirst('h', "sh");
      temporaryName = temporaryName.replaceAll('q', "qy");
      temporaryName = temporaryName.replaceFirst('z', "ch");
      temporaryLastName = temporaryLastName.replaceFirst('y', "ya");
      temporaryLastName = temporaryLastName.replaceAll('q', "ya");
    } else {
      temporaryName = temporaryName.replaceFirst('h', "ch");
      temporaryName = temporaryName.replaceAll('q', "qe");
      temporaryName = temporaryName.replaceFirst('z', "sh");
      temporaryLastName = temporaryLastName.replaceFirst('y', "yo");
      temporaryLastName = temporaryLastName.replaceAll('q', "qo");
    }
    temporaryName = stoppingUnlikelyDoubleLetters(temporaryName);
    temporaryLastName = stoppingUnlikelyDoubleLetters(temporaryLastName);
    temporaryName = stoppingTripleAndQuadripleLetters(temporaryName);
    temporaryLastName = stoppingTripleAndQuadripleLetters(temporaryLastName);
    if (isMale) {
      temporaryName = changeLastLettersAcordingToGender(
          temporaryName, "a", "e", "i", "n", "ng", "c");
    } else {
      temporaryName = changeLastLettersAcordingToGender(
          temporaryName, "o", "k", "r", "ha", "ez", "aw");
    }
    return [temporaryName, temporaryLastName];
  }

  /// generates names for haflings
  gnomeNameGenerator() {
    generalNameGenerator(3, 6);
    fullName = alterGnomeNameCharacters(tempFullName[0], tempFullName[1]);
  }

// Hafling designated part =================================================================

  ///  /// alters some of the letters of names for haflings
  List<String> alterHaflingNameCharacters(
      String temporaryName, String temporaryLastName) {
    if (randomChance < 3) {
      temporaryName = temporaryName.replaceFirst('w', "fi");
      temporaryName = temporaryName.replaceFirst('k', "fu");
      temporaryName = temporaryName.replaceFirst('z', "pa");
      temporaryName = temporaryName.replaceFirst('x', "la");
      temporaryName = temporaryName.replaceAll('q', "qa");
      temporaryLastName = temporaryLastName.replaceFirst('w', "kla");
      temporaryLastName = temporaryLastName.replaceFirst('k', "b");
      temporaryLastName = temporaryLastName.replaceFirst('x', "g");
      temporaryLastName = temporaryLastName.replaceAll('q', "qi");
    } else {
      temporaryName = temporaryName.replaceFirst('w', "de");
      temporaryName = temporaryName.replaceFirst('k', "ga");
      temporaryName = temporaryName.replaceFirst('z', "ta");
      temporaryName = temporaryName.replaceFirst('x', "le");
      temporaryName = temporaryName.replaceAll('q', "qi");
      temporaryLastName = temporaryLastName.replaceAll('q', "qy");
      temporaryLastName = temporaryLastName.replaceFirst('x', "ga");
      temporaryLastName = temporaryLastName.replaceFirst('w', "du");
      temporaryLastName = temporaryLastName.replaceFirst('k', "fe");
    }
    temporaryName = stoppingUnlikelyDoubleLetters(temporaryName);
    temporaryLastName = stoppingUnlikelyDoubleLetters(temporaryLastName);
    temporaryName = stoppingTripleAndQuadripleLetters(temporaryName);
    temporaryLastName = stoppingTripleAndQuadripleLetters(temporaryLastName);
    if (isMale) {
      temporaryName = changeLastLettersAcordingToGender(
          temporaryName, "a", "e", "i", "z", "g", "r");
    } else {
      temporaryName = changeLastLettersAcordingToGender(
          temporaryName, "o", "u", "i", "y", "az", "l");
    }
    return [temporaryName, temporaryLastName];
  }

  /// generates names for haflings
  haflingNameGenerator() {
    generalNameGenerator(3, 6);
    fullName = alterHaflingNameCharacters(tempFullName[0], tempFullName[1]);
  }

// Half-elf and Half-orc designated part ====================================================

  halfHumanNameGenerator() {
    var chance = rollingDice(12);
    if (chance < 4) {
      if (chosenRace.name == "Half-elf") {
        elfNameGenerator();
      } else {
        orcNameGenerator();
      }
    } else if (chance > 3 && chance < 7) {
      if (chosenRace.name == "Half-elf") {
        elfNameGenerator();
        humanNameGenerator();
        newLastName = fullName[1];
        notifyListeners();
      } else {
        orcNameGenerator();
        humanNameGenerator();
        newLastName = fullName[1];
        notifyListeners();
      }
    } else if (chance > 6 && chance < 10) {
      if (chosenRace.name == "Half-elf") {
        elfNameGenerator();
        humanNameGenerator();
        newName = fullName[0];
        notifyListeners();
      } else {
        orcNameGenerator();
        humanNameGenerator();
        newName = fullName[0];
        notifyListeners();
      }
    } else if (chance > 9) {
      humanNameGenerator();
    }
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
    } else if (isFemale) {
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
    }
    fullName = [newName, newLastName];
    notifyListeners();
  }

// Orc designated part ====================================================================

  /// alters some of the characters of names for orcs
  List<String> alterOrcNameCharacters(
      String temporaryName, String temporaryLastName) {
    if (randomChance < 3) {
      temporaryName = temporaryName.replaceFirst('h', "sh");
      temporaryName = temporaryName.replaceFirst('q', "qka");
      temporaryName = temporaryName.replaceFirst('a', "ak");
      temporaryLastName = temporaryLastName.replaceFirst('y', "ya");
      temporaryLastName = temporaryLastName.replaceFirst('a', "ka");
      temporaryLastName = temporaryLastName.replaceFirst('q', "qy");
    } else {
      temporaryName = temporaryName.replaceFirst('h', "ch");
      temporaryName = temporaryName.replaceFirst('q', "qt");
      temporaryName = temporaryName.replaceFirst('a', "ac");
      temporaryLastName = temporaryLastName.replaceFirst('a', "ca");
      temporaryLastName = temporaryLastName.replaceFirst('y', "yo");
      temporaryLastName = temporaryLastName.replaceFirst('q', "qi");
    }
    temporaryName = stoppingUnlikelyDoubleLetters(temporaryName);
    temporaryLastName = stoppingUnlikelyDoubleLetters(temporaryLastName);
    temporaryName = stoppingTripleAndQuadripleLetters(temporaryName);
    temporaryLastName = stoppingTripleAndQuadripleLetters(temporaryLastName);
    if (isMale) {
      temporaryName = changeLastLettersAcordingToGender(
          temporaryName, "a", "e", "i", "ck", "zur", "d");
    } else {
      temporaryName = changeLastLettersAcordingToGender(
          temporaryName, "o", "u", "i", "la", "dar", "par");
    }
    return [temporaryName, temporaryLastName];
  }

  /// generates names for orcs
  orcNameGenerator() {
    generalNameGenerator(2, 5);
    fullName = alterOrcNameCharacters(tempFullName[0], tempFullName[1]);
  }

  /// calls the respective race name generator
  newNameGenerator() {
    switch (chosenRace.name) {
      case "Human":
        humanNameGenerator();
        break;
      case "Half-elf":
        halfHumanNameGenerator();
        break;
      case "Orc":
        orcNameGenerator();
        break;
      case "Half-orc":
        halfHumanNameGenerator();
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
    capitalize(fullName[0], fullName[1]);
    notifyListeners();
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
      callMessageSnackbar(context, noNameMessage, noNameColor, null);
      return;
    }
    for (var name in savedNames) {
      if (name.firstName == newName && name.lastName == newLastName) {
        callMessageSnackbar(
            context, alreadySavedmessage, alreadySavedColor, null);
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
    callMessageSnackbar(context, savedMessage, sucessColor, null);
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
    cha = CharModel(
        charRace: RaceModel(
          name: chosenRace.name,
          isSelected: chosenRace.isSelected,
          height: KeyValueModel(key: 0, value: 0),
          weight: 0,
          age: 0,
          speed: 0,
        ),
        feats: [],
        physicalStyle: physicalStyleChoice,
        battleStyle: chosenStyle,
        charName: NameModel(
          gender: isMale ? "Male" : "Female",
          name: newName,
          surname: newLastName,
          fullName: "$newName $newLastName",
          personalPronoun: isMale ? "he" : "she",
          objectPronoun: isMale ? "him" : "her",
          possessiveAdjective: isMale ? "his" : "her",
        ),
        alignment: chosenAlignment,
        combatStats: CombatModel(),
        charClass: chosenClass,
        baseAtributes: AtributeModel(),
        modAtributes: AtributeModel(),
        charEquip: EquipModel(),
        hitPoints: 0,
        resistances: ResistanceModel(),
        loot: LootModel(),
        charLevel: levelSelected + 1);
    notifyListeners();
  }

//=======================================================================================

  String? activateNextButton() {
    if (creationStage == 1) {
      updateChosenRace();
      advanceCreationStage();
      return null;
    } else if (creationStage == 2) {
      if (newName == " - ? - ") {
        return "You must generate a name first";
      } else {
        advanceCreationStage();
        return null;
      }
    } else if (creationStage == 3) {
      updateChosenCombatStyle();
      filterClasses();
      advanceCreationStage();
      return null;
    } else if (creationStage == 4) {
      updateChosenClass();
      advanceCreationStage();
      return null;
    } else if (creationStage == 5) {
      filterAlignmentsToClass();
      advanceCreationStage();
      return null;
    } else if (creationStage == 6) {
      updateChosenAlignment();
      advanceCreationStage();
      return null;
    } else if (creationStage == 7) {
      if (levelSelected == -1) {
        return "You need to select a level befor advancing";
      } else {
        updateLevelSelectedIfEpic();
        updateLevelSelectedIfLegendary();
        updateCharModel();
        applyHeightAndWeight();
        claculateAge();
        advanceCreationStage();
      }
      return null;
    } else if (creationStage == 8) {
      return null;
    }
    return null;
  }

  startCharAllOver() {
    newName = ' - ? - ';
    newLastName = ' - ? - ';
    levelSelected = -1;
    starttempRace();
    startTempClass();
    tempRaceForSwitching.isSelected = true;
    tempClassForSwitching.isSelected = true;
    creationStage = 1;
    notifyListeners();
  }
}
