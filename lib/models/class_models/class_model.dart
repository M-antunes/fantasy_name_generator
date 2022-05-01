import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fantasy_name_generator/models/class_models/specials_model.dart';
import 'package:fantasy_name_generator/models/class_models/traits_model.dart';

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
  final List<String> permittedAligments;
  List<TraitModel>? traits;
  List<SpecialsModel>? specials;
  final String specialName;
  final int skillRankPerLevel;
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
    required this.permittedAligments,
    this.traits = const [],
    this.specials = const [],
    this.specialName = "",
    required this.skillRankPerLevel,
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
    List<String>? permittedAligments,
    List<TraitModel>? traits,
    List<SpecialsModel>? specials,
    String? specialName,
    int? skillRankPerLevel,
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
      permittedAligments: permittedAligments ?? this.permittedAligments,
      traits: traits ?? this.traits,
      specials: specials ?? this.specials,
      specialName: specialName ?? this.specialName,
      skillRankPerLevel: skillRankPerLevel ?? this.skillRankPerLevel,
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
      'permittedAligments': permittedAligments,
      'traits': traits?.map((x) => x.toMap()).toList(),
      'specials': specials?.map((x) => x.toMap()).toList(),
      'specialName': specialName,
      'skillRankPerLevel': skillRankPerLevel,
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
      permittedAligments: List<String>.from(map['permittedAligments']),
      traits: map['traits'] != null
          ? List<TraitModel>.from(
              map['traits']?.map((x) => TraitModel.fromMap(x)))
          : null,
      specials: map['specials'] != null
          ? List<SpecialsModel>.from(
              map['specials']?.map((x) => SpecialsModel.fromMap(x)))
          : null,
      specialName: map['specialName'] ?? '',
      skillRankPerLevel: map['skillRankPerLevel']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassModel.fromJson(String source) =>
      ClassModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ClassModel(name: $name, isSelected: $isSelected, mainAtrb: $mainAtrb, hitDice: $hitDice, resistUpgrade: $resistUpgrade, description: $description, classIcon: $classIcon, combatStyle: $combatStyle, forbidenArmorType: $forbidenArmorType, permittedAligments: $permittedAligments, traits: $traits, specials: $specials, specialName: $specialName, skillRankPerLevel: $skillRankPerLevel)';
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
        listEquals(other.forbidenArmorType, forbidenArmorType) &&
        listEquals(other.permittedAligments, permittedAligments) &&
        listEquals(other.traits, traits) &&
        listEquals(other.specials, specials) &&
        other.specialName == specialName &&
        other.skillRankPerLevel == skillRankPerLevel;
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
        forbidenArmorType.hashCode ^
        permittedAligments.hashCode ^
        traits.hashCode ^
        specials.hashCode ^
        specialName.hashCode ^
        skillRankPerLevel.hashCode;
  }
}
