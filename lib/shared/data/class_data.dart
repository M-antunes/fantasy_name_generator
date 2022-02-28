import 'package:fantasy_name_generator/models/class_model.dart';

class ClassData {
  final List<ClassModel> allClasses = [
    ClassModel(isSelected: true, name: "Alchemist"),
    ClassModel(isSelected: false, name: "Aristocrat"),
    ClassModel(isSelected: false, name: "Barbarian"),
    ClassModel(isSelected: false, name: "Bandit"),
    ClassModel(isSelected: false, name: "Bard"),
    ClassModel(isSelected: false, name: "Cleric"),
    ClassModel(isSelected: false, name: "Commoner"),
    ClassModel(isSelected: false, name: "Druid"),
    ClassModel(isSelected: false, name: "Monk"),
    ClassModel(isSelected: false, name: "Noble"),
    ClassModel(isSelected: false, name: "Paladin"),
    ClassModel(isSelected: false, name: "Ranger"),
    ClassModel(isSelected: false, name: "Rogue"),
    ClassModel(isSelected: false, name: "Sorcerer"),
    ClassModel(isSelected: false, name: "Warrior"),
    ClassModel(isSelected: false, name: "Wizard"),
  ];

  final List<ClassModel> physicalClasses = [
    ClassModel(isSelected: false, name: "Barbarian"),
    ClassModel(isSelected: false, name: "Bandit"),
    ClassModel(isSelected: false, name: "Paladin"),
    ClassModel(isSelected: false, name: "Warrior"),
    ClassModel(isSelected: false, name: "Rogue"),
    ClassModel(isSelected: false, name: "Ranger"),
    ClassModel(isSelected: false, name: "Monk"),
    ClassModel(isSelected: false, name: "Cleric"),
    ClassModel(isSelected: false, name: "Druid"),
  ];

  final List<ClassModel> mentalClasses = [
    ClassModel(isSelected: false, name: "Aristocrat"),
    ClassModel(isSelected: false, name: "Noble"),
    ClassModel(isSelected: false, name: "Sorcerer"),
    ClassModel(isSelected: false, name: "Wizard"),
    ClassModel(isSelected: false, name: "Bard"),
    ClassModel(isSelected: true, name: "Alchemist"),
  ];
}
