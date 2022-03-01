import 'package:fantasy_name_generator/models/class_model.dart';

class ClassData {
  final List<ClassModel> allClasses = [
    ClassModel(
        isSelected: true, hitDice: 8, mainAtrb: "Int", name: "Alchemist"),
    ClassModel(
        isSelected: false, hitDice: 8, mainAtrb: "Int", name: "Aristocrat"),
    ClassModel(
        isSelected: false, hitDice: 12, mainAtrb: "Str", name: "Barbarian"),
    ClassModel(isSelected: false, hitDice: 8, mainAtrb: "Str", name: "Bandit"),
    ClassModel(isSelected: false, hitDice: 8, mainAtrb: "Wis", name: "Bard"),
    ClassModel(isSelected: false, hitDice: 8, mainAtrb: "Wis", name: "Cleric"),
    ClassModel(
        isSelected: false, hitDice: 4, mainAtrb: "Str", name: "Commoner"),
    ClassModel(isSelected: false, hitDice: 8, mainAtrb: "Wis", name: "Druid"),
    ClassModel(isSelected: false, hitDice: 8, mainAtrb: "Dex", name: "Monk"),
    ClassModel(isSelected: false, hitDice: 4, mainAtrb: "Cha", name: "Noble"),
    ClassModel(
        isSelected: false, hitDice: 10, mainAtrb: "Str", name: "Paladin"),
    ClassModel(isSelected: false, hitDice: 10, mainAtrb: "Dex", name: "Ranger"),
    ClassModel(isSelected: false, hitDice: 8, mainAtrb: "Dex", name: "Rogue"),
    ClassModel(
        isSelected: false, hitDice: 6, mainAtrb: "Cha", name: "Sorcerer"),
    ClassModel(
        isSelected: false, hitDice: 10, mainAtrb: "Str", name: "Warrior"),
    ClassModel(isSelected: false, hitDice: 6, mainAtrb: "Int", name: "Wizard"),
  ];

  final List<ClassModel> physicalClasses = [
    ClassModel(
        isSelected: false, hitDice: 12, mainAtrb: "Str", name: "Barbarian"),
    ClassModel(isSelected: false, hitDice: 8, mainAtrb: "Str", name: "Bandit"),
    ClassModel(
        isSelected: false, hitDice: 10, mainAtrb: "Str", name: "Paladin"),
    ClassModel(
        isSelected: false, hitDice: 10, mainAtrb: "Str", name: "Warrior"),
    ClassModel(isSelected: false, hitDice: 8, mainAtrb: "Dex", name: "Rogue"),
    ClassModel(isSelected: false, hitDice: 10, mainAtrb: "Dex", name: "Ranger"),
    ClassModel(isSelected: false, hitDice: 8, mainAtrb: "Dex", name: "Monk"),
  ];

  final List<ClassModel> mentalClasses = [
    ClassModel(
        isSelected: false, hitDice: 4, mainAtrb: "Int", name: "Aristocrat"),
    ClassModel(isSelected: false, hitDice: 4, mainAtrb: "Cha", name: "Noble"),
    ClassModel(
        isSelected: false, hitDice: 6, mainAtrb: "Cha", name: "Sorcerer"),
    ClassModel(isSelected: false, hitDice: 6, mainAtrb: "Int", name: "Wizard"),
    ClassModel(isSelected: false, hitDice: 8, mainAtrb: "Wis", name: "Bard"),
    ClassModel(
        isSelected: false, hitDice: 8, mainAtrb: "Int", name: "Alchemist"),
    ClassModel(isSelected: false, hitDice: 8, mainAtrb: "Wis", name: "Cleric"),
    ClassModel(isSelected: false, hitDice: 8, mainAtrb: "Wis", name: "Druid"),
  ];
}
