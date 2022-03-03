import 'package:fantasy_name_generator/models/class_model.dart';
import 'package:fantasy_name_generator/models/level_model.dart';

class ClassData {
  final List<ClassModel> allClasses = [
    ClassModel(
        isSelected: true,
        hitDice: 8,
        mainAtrb: "Int",
        resistUpgrade: "fort, ref",
        name: "Alchemist"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "",
        hitDice: 4,
        mainAtrb: "Int",
        name: "Aristocrat"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort",
        hitDice: 12,
        mainAtrb: "Str",
        name: "Barbarian"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort",
        hitDice: 8,
        mainAtrb: "Str",
        name: "Bandit"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "ref, will",
        hitDice: 8,
        mainAtrb: "Wis",
        name: "Bard"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort, will",
        hitDice: 8,
        mainAtrb: "Wis",
        name: "Cleric"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "",
        hitDice: 4,
        mainAtrb: "Str",
        name: "Commoner"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort, will",
        hitDice: 8,
        mainAtrb: "Wis",
        name: "Druid"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "all",
        hitDice: 8,
        mainAtrb: "Dex",
        name: "Monk"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "",
        hitDice: 4,
        mainAtrb: "Cha",
        name: "Noble"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort, will",
        hitDice: 10,
        mainAtrb: "Str",
        name: "Paladin"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort, ref",
        hitDice: 10,
        mainAtrb: "Dex",
        name: "Ranger"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "ref",
        hitDice: 8,
        mainAtrb: "Dex",
        name: "Rogue"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "will",
        hitDice: 6,
        mainAtrb: "Cha",
        name: "Sorcerer"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort",
        hitDice: 10,
        mainAtrb: "Str",
        name: "Warrior"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "will",
        hitDice: 6,
        mainAtrb: "Int",
        name: "Wizard"),
  ];

  final List<ClassModel> physicalClasses = [
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort",
        hitDice: 12,
        mainAtrb: "Str",
        name: "Barbarian"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort",
        hitDice: 8,
        mainAtrb: "Str",
        name: "Bandit"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort",
        hitDice: 10,
        mainAtrb: "Str",
        name: "Paladin"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort",
        hitDice: 10,
        mainAtrb: "Str",
        name: "Warrior"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "ref",
        hitDice: 8,
        mainAtrb: "Dex",
        name: "Rogue"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort, ref",
        hitDice: 10,
        mainAtrb: "Dex",
        name: "Ranger"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "all",
        hitDice: 8,
        mainAtrb: "Dex",
        name: "Monk"),
  ];

  final List<ClassModel> mentalClasses = [
    ClassModel(
        isSelected: false,
        resistUpgrade: "",
        hitDice: 4,
        mainAtrb: "Int",
        name: "Aristocrat"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "",
        hitDice: 4,
        mainAtrb: "Cha",
        name: "Noble"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "will",
        hitDice: 6,
        mainAtrb: "Cha",
        name: "Sorcerer"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "will",
        hitDice: 6,
        mainAtrb: "Int",
        name: "Wizard"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "ref, will",
        hitDice: 8,
        mainAtrb: "Wis",
        name: "Bard"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort, ref",
        hitDice: 8,
        mainAtrb: "Int",
        name: "Alchemist"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort, will",
        hitDice: 8,
        mainAtrb: "Wis",
        name: "Cleric"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort, will",
        hitDice: 8,
        mainAtrb: "Wis",
        name: "Druid"),
  ];

  List<LevelModel> goodOrBad = [
    LevelModel(level: 1, good: 2, bad: 0),
    LevelModel(level: 2, good: 3, bad: 0),
    LevelModel(level: 3, good: 3, bad: 1),
    LevelModel(level: 4, good: 4, bad: 1),
    LevelModel(level: 5, good: 4, bad: 1),
    LevelModel(level: 6, good: 5, bad: 2),
    LevelModel(level: 7, good: 5, bad: 2),
    LevelModel(level: 8, good: 6, bad: 2),
    LevelModel(level: 9, good: 6, bad: 3),
    LevelModel(level: 10, good: 7, bad: 3),
    LevelModel(level: 11, good: 7, bad: 3),
    LevelModel(level: 12, good: 8, bad: 4),
    LevelModel(level: 13, good: 8, bad: 4),
    LevelModel(level: 14, good: 9, bad: 4),
    LevelModel(level: 15, good: 9, bad: 5),
    LevelModel(level: 16, good: 10, bad: 5),
    LevelModel(level: 17, good: 10, bad: 5),
    LevelModel(level: 18, good: 11, bad: 6),
    LevelModel(level: 19, good: 11, bad: 6),
    LevelModel(level: 20, good: 12, bad: 6),
    LevelModel(level: 21, good: 13, bad: 7),
    LevelModel(level: 22, good: 13, bad: 8),
    LevelModel(level: 23, good: 14, bad: 8),
    LevelModel(level: 24, good: 15, bad: 8),
    LevelModel(level: 25, good: 15, bad: 9),
    LevelModel(level: 26, good: 16, bad: 10),
    LevelModel(level: 27, good: 17, bad: 10),
    LevelModel(level: 28, good: 17, bad: 10),
    LevelModel(level: 29, good: 18, bad: 10),
    LevelModel(level: 30, good: 19, bad: 11),
  ];
}
