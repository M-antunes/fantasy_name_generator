import 'package:flutter/foundation.dart';

import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';
import 'package:fantasy_name_generator/models/char_personal_models/language_model.dart';

class CharModel {
  RaceModel charRace;
  NameModel charName;
  PhysicalStyleModel physicalStyle;
  CombatStyleChoiceModel battleStyle;
  AttributeModel baseAttributes;
  AttributeModel modAttributes;
  ClassModel charClass;
  AlignmentModel alignment;
  int hitPoints;
  ResistanceModel resistances;
  CombatModel combatStats;
  EquipModel charEquip;
  LootModel loot;
  int charLevel;
  List<TraitModel> feats;
  List<SkillModel> skills;
  List<LanguageModel> languages;

  CharModel({
    required this.charRace,
    required this.charName,
    required this.physicalStyle,
    required this.battleStyle,
    required this.baseAttributes,
    required this.modAttributes,
    required this.charClass,
    required this.alignment,
    required this.hitPoints,
    required this.resistances,
    required this.combatStats,
    required this.charEquip,
    required this.loot,
    required this.charLevel,
    required this.feats,
    required this.skills,
    required this.languages,
  });

  CharModel copyWith({
    RaceModel? charRace,
    NameModel? charName,
    PhysicalStyleModel? physicalStyle,
    CombatStyleChoiceModel? battleStyle,
    AttributeModel? baseAttributes,
    AttributeModel? modAttributes,
    ClassModel? charClass,
    AlignmentModel? alignment,
    int? hitPoints,
    ResistanceModel? resistances,
    CombatModel? combatStats,
    EquipModel? charEquip,
    LootModel? loot,
    int? charLevel,
    List<TraitModel>? feats,
    List<SkillModel>? skills,
    List<LanguageModel>? languages,
  }) {
    return CharModel(
      charRace: charRace ?? this.charRace,
      charName: charName ?? this.charName,
      physicalStyle: physicalStyle ?? this.physicalStyle,
      battleStyle: battleStyle ?? this.battleStyle,
      baseAttributes: baseAttributes ?? this.baseAttributes,
      modAttributes: modAttributes ?? this.modAttributes,
      charClass: charClass ?? this.charClass,
      alignment: alignment ?? this.alignment,
      hitPoints: hitPoints ?? this.hitPoints,
      resistances: resistances ?? this.resistances,
      combatStats: combatStats ?? this.combatStats,
      charEquip: charEquip ?? this.charEquip,
      loot: loot ?? this.loot,
      charLevel: charLevel ?? this.charLevel,
      feats: feats ?? this.feats,
      skills: skills ?? this.skills,
      languages: languages ?? this.languages,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'charRace': charRace.toMap(),
      'charName': charName.toMap(),
      'physicalStyle': physicalStyle.toMap(),
      'battleStyle': battleStyle.toMap(),
      'baseAttributes': baseAttributes.toMap(),
      'modAttributes': modAttributes.toMap(),
      'charClass': charClass.toMap(),
      'alignment': alignment.toMap(),
      'hitPoints': hitPoints,
      'resistances': resistances.toMap(),
      'combatStats': combatStats.toMap(),
      'charEquip': charEquip.toMap(),
      'loot': loot.toMap(),
      'charLevel': charLevel,
      'feats': feats.map((x) => x.toMap()).toList(),
      'skills': skills.map((x) => x.toMap()).toList(),
      'languages': languages.map((x) => x.toMap()).toList(),
    };
  }

  factory CharModel.fromMap(Map<String, dynamic> map) {
    return CharModel(
      charRace: RaceModel.fromMap(map['charRace']),
      charName: NameModel.fromMap(map['charName']),
      physicalStyle: PhysicalStyleModel.fromMap(map['physicalStyle']),
      battleStyle: CombatStyleChoiceModel.fromMap(map['battleStyle']),
      baseAttributes: AttributeModel.fromMap(map['baseAttributes']),
      modAttributes: AttributeModel.fromMap(map['modAttributes']),
      charClass: ClassModel.fromMap(map['charClass']),
      alignment: AlignmentModel.fromMap(map['alignment']),
      hitPoints: map['hitPoints']?.toInt() ?? 0,
      resistances: ResistanceModel.fromMap(map['resistances']),
      combatStats: CombatModel.fromMap(map['combatStats']),
      charEquip: EquipModel.fromMap(map['charEquip']),
      loot: LootModel.fromMap(map['loot']),
      charLevel: map['charLevel']?.toInt() ?? 0,
      feats: List<TraitModel>.from(
          map['feats']?.map((x) => TraitModel.fromMap(x))),
      skills: List<SkillModel>.from(
          map['skills']?.map((x) => SkillModel.fromMap(x))),
      languages: List<LanguageModel>.from(
          map['languages']?.map((x) => LanguageModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharModel.fromJson(String source) =>
      CharModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CharModel(charRace: $charRace, charName: $charName, physicalStyle: $physicalStyle, battleStyle: $battleStyle, baseAttributes: $baseAttributes, modAttributes: $modAttributes, charClass: $charClass, alignment: $alignment, hitPoints: $hitPoints, resistances: $resistances, combatStats: $combatStats, charEquip: $charEquip, loot: $loot, charLevel: $charLevel, feats: $feats, skills: $skills, languages: $languages)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CharModel &&
        other.charRace == charRace &&
        other.charName == charName &&
        other.physicalStyle == physicalStyle &&
        other.battleStyle == battleStyle &&
        other.baseAttributes == baseAttributes &&
        other.modAttributes == modAttributes &&
        other.charClass == charClass &&
        other.alignment == alignment &&
        other.hitPoints == hitPoints &&
        other.resistances == resistances &&
        other.combatStats == combatStats &&
        other.charEquip == charEquip &&
        other.loot == loot &&
        other.charLevel == charLevel &&
        listEquals(other.feats, feats) &&
        listEquals(other.skills, skills) &&
        listEquals(other.languages, languages);
  }

  @override
  int get hashCode {
    return charRace.hashCode ^
        charName.hashCode ^
        physicalStyle.hashCode ^
        battleStyle.hashCode ^
        baseAttributes.hashCode ^
        modAttributes.hashCode ^
        charClass.hashCode ^
        alignment.hashCode ^
        hitPoints.hashCode ^
        resistances.hashCode ^
        combatStats.hashCode ^
        charEquip.hashCode ^
        loot.hashCode ^
        charLevel.hashCode ^
        feats.hashCode ^
        skills.hashCode ^
        languages.hashCode;
  }
}
