import 'dart:convert';

import 'package:flutter/foundation.dart';

class ClassModel {
  final String name;
  bool isSelected;
  final String mainAtrb;
  final int? hitDice;
  final String? resistUpgrade;
  final String? description;
  final String? classIcon;
  final String combatStyle;
  final List<String> forbidenArmorType;
  ClassModel({
    required this.name,
    required this.isSelected,
    required this.mainAtrb,
    this.hitDice,
    this.resistUpgrade,
    this.description,
    this.classIcon,
    required this.combatStyle,
    required this.forbidenArmorType,
  });

  ClassModel copyWith({
    String? name,
    bool? isSelected,
    String? mainAtrb,
    int? hitDice,
    String? resistUpgrade,
    String? description,
    String? classIcon,
    String? combatStyle,
    List<String>? forbidenArmorType,
  }) {
    return ClassModel(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      mainAtrb: mainAtrb ?? this.mainAtrb,
      hitDice: hitDice ?? this.hitDice,
      resistUpgrade: resistUpgrade ?? this.resistUpgrade,
      description: description ?? this.description,
      classIcon: classIcon ?? this.classIcon,
      combatStyle: combatStyle ?? this.combatStyle,
      forbidenArmorType: forbidenArmorType ?? this.forbidenArmorType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSelected': isSelected,
      'mainAtrb': mainAtrb,
      'hitDice': hitDice,
      'resistUpgrade': resistUpgrade,
      'description': description,
      'classIcon': classIcon,
      'combatStyle': combatStyle,
      'forbidenArmorType': forbidenArmorType,
    };
  }

  factory ClassModel.fromMap(Map<String, dynamic> map) {
    return ClassModel(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
      mainAtrb: map['mainAtrb'] ?? '',
      hitDice: map['hitDice']?.toInt(),
      resistUpgrade: map['resistUpgrade'],
      description: map['description'],
      classIcon: map['classIcon'],
      combatStyle: map['combatStyle'] ?? '',
      forbidenArmorType: List<String>.from(map['forbidenArmorType']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassModel.fromJson(String source) =>
      ClassModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ClassModel(name: $name, isSelected: $isSelected, mainAtrb: $mainAtrb, hitDice: $hitDice, resistUpgrade: $resistUpgrade, description: $description, classIcon: $classIcon, combatStyle: $combatStyle, forbidenArmorType: $forbidenArmorType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ClassModel &&
        other.name == name &&
        other.isSelected == isSelected &&
        other.mainAtrb == mainAtrb &&
        other.hitDice == hitDice &&
        other.resistUpgrade == resistUpgrade &&
        other.description == description &&
        other.classIcon == classIcon &&
        other.combatStyle == combatStyle &&
        listEquals(other.forbidenArmorType, forbidenArmorType);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        isSelected.hashCode ^
        mainAtrb.hashCode ^
        hitDice.hashCode ^
        resistUpgrade.hashCode ^
        description.hashCode ^
        classIcon.hashCode ^
        combatStyle.hashCode ^
        forbidenArmorType.hashCode;
  }
}
